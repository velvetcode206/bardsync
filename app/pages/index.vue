<script setup lang="ts">
const { t } = useI18n()

const session = authClient.useSession()

useSeoMeta({ title: t('pages.home.title') })

/* ---------- Users ---------- */
const {
  data,
  status,
  execute,
} = await useFetch('/api/users', {
  key: 'users-get',
  immediate: false,
})

const users = ref<User[]>([])

async function getUsers() {
  await execute()
  users.value = data.value ?? []
}

function clearUsers() {
  users.value = []
}

const form = reactive({ name: '', email: '' })

const {
  status: postStatus,
  error: postError,
  execute: postUser,
} = await useFetch('/api/users', {
  key: 'users-post',
  method: 'POST',
  body: form,
  immediate: false,
  watch: false,
})

async function addUser() {
  await postUser()
  if (postError.value)
    return

  form.name = ''
  form.email = ''
  await getUsers()
}

/* ---------- Auth ---------- */
const mode = ref<'signIn' | 'signUp'>('signIn')
const authForm = reactive({
  name: '',
  email: '',
  password: '',
})
const authPending = ref(false)
const authError = ref('')

function toggleMode() {
  mode.value = mode.value === 'signIn' ? 'signUp' : 'signIn'
  authError.value = ''
}

async function signUp() {
  authPending.value = true
  authError.value = ''

  const { error } = await authClient.signUp.email({
    name: authForm.name,
    email: authForm.email,
    password: authForm.password,
  })

  authPending.value = false
  if (error) {
    authError.value = error.message || 'Sign up failed'
    return
  }

  authForm.password = ''
}

async function signIn() {
  authPending.value = true
  authError.value = ''

  const { error } = await authClient.signIn.email({
    email: authForm.email,
    password: authForm.password,
  })

  authPending.value = false
  if (error) {
    authError.value = error.message || 'Sign in failed'
    return
  }

  authForm.password = ''
}

async function logOut() {
  authPending.value = true
  authError.value = ''

  const { error } = await authClient.signOut()

  authPending.value = false
  if (error) {
    authError.value = error.message || 'Logout failed'
  }
}

function submitAuth() {
  return mode.value === 'signIn' ? signIn() : signUp()
}
</script>

<template>
  <div class="mx-auto max-w-md space-y-6 p-6">
    <h1 class="text-2xl font-semibold">
      {{ t('title') }}
    </h1>

    <!-- Auth -->
    <section class="space-y-3 rounded border border-gray-200 p-4">
      <!-- Loading -->
      <p v-if="session.isPending" class="text-sm text-gray-500">
        Loading...
      </p>

      <!-- Logged in -->
      <div
        v-else-if="session.data?.user"
        class="flex items-center justify-between gap-3"
      >
        <div class="min-w-0">
          <p class="truncate font-medium">
            {{ session.data.user.name }}
          </p>
          <p class="truncate text-sm text-gray-500">
            {{ session.data.user.email }}
          </p>
        </div>
        <button
          type="button"
          :disabled="authPending"
          class="cursor-pointer rounded border border-gray-300 px-3 py-1 hover:bg-gray-100 disabled:cursor-not-allowed disabled:opacity-50"
          @click="logOut()"
        >
          {{ authPending ? '...' : 'Log out' }}
        </button>
      </div>

      <!-- Logged out -->
      <form v-else class="space-y-3" @submit.prevent="submitAuth">
        <h2 class="text-lg font-medium">
          {{ mode === 'signIn' ? 'Sign in' : 'Create account' }}
        </h2>

        <input
          v-if="mode === 'signUp'"
          v-model="authForm.name"
          type="text"
          placeholder="Name"
          required
          autocomplete="name"
          class="w-full rounded border border-gray-300 px-3 py-2 focus:border-blue-500 focus:outline-none"
        >
        <input
          v-model="authForm.email"
          type="email"
          placeholder="Email"
          required
          autocomplete="email"
          class="w-full rounded border border-gray-300 px-3 py-2 focus:border-blue-500 focus:outline-none"
        >
        <input
          v-model="authForm.password"
          type="password"
          placeholder="Password"
          required
          minlength="8"
          :autocomplete="mode === 'signIn' ? 'current-password' : 'new-password'"
          class="w-full rounded border border-gray-300 px-3 py-2 focus:border-blue-500 focus:outline-none"
        >

        <button
          type="submit"
          :disabled="authPending"
          class="w-full cursor-pointer rounded bg-blue-600 px-4 py-2 text-white hover:bg-blue-700 disabled:cursor-not-allowed disabled:opacity-50"
        >
          <template v-if="authPending">
            Please wait...
          </template>
          <template v-else>
            {{ mode === 'signIn' ? 'Sign in' : 'Sign up' }}
          </template>
        </button>

        <p v-if="authError" class="text-sm text-red-600">
          {{ authError }}
        </p>

        <button
          type="button"
          class="cursor-pointer text-sm text-blue-600 hover:underline"
          @click="toggleMode"
        >
          {{ mode === 'signIn' ? 'No account? Sign up' : 'Already have an account? Sign in' }}
        </button>
      </form>
    </section>

    <!-- Add user -->
    <form class="space-y-3" @submit.prevent="addUser">
      <input
        v-model="form.name"
        type="text"
        placeholder="Name"
        required
        class="w-full rounded border border-gray-300 px-3 py-2 focus:border-blue-500 focus:outline-none"
      >
      <input
        v-model="form.email"
        type="email"
        placeholder="Email"
        required
        class="w-full rounded border border-gray-300 px-3 py-2 focus:border-blue-500 focus:outline-none"
      >
      <button
        type="submit"
        :disabled="postStatus === 'pending'"
        class="w-full cursor-pointer rounded bg-blue-600 px-4 py-2 text-white hover:bg-blue-700 disabled:cursor-not-allowed disabled:opacity-50"
      >
        {{ postStatus === 'pending' ? 'Adding...' : 'Add user' }}
      </button>
      <p v-if="postError" class="text-sm text-red-600">
        {{ postError.statusText || postError.message }}
      </p>
    </form>

    <div class="flex gap-2">
      <button
        :disabled="status === 'pending'"
        class="cursor-pointer rounded border border-gray-300 px-3 py-1 hover:bg-gray-100 disabled:opacity-50"
        @click="getUsers()"
      >
        Load
      </button>
      <button
        :disabled="status === 'pending'"
        class="cursor-pointer rounded border border-gray-300 px-3 py-1 hover:bg-gray-100 disabled:opacity-50"
        @click="clearUsers()"
      >
        Clear
      </button>
    </div>

    <ul v-if="users.length" class="divide-y divide-gray-200 rounded border border-gray-200">
      <li v-for="user in users" :key="user.id" class="px-3 py-2">
        <span class="font-medium">{{ user.name }}</span>
        <span class="ml-2 text-sm text-gray-500">{{ user.email }}</span>
      </li>
    </ul>
  </div>
</template>
