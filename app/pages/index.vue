<script setup lang="ts">
const { t } = useI18n()

useSeoMeta({ title: t('pages.home.title') })

const {
  data,
  status,
  execute,
} = await useFetch('/api/users', { key: 'users-get', immediate: false })

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
</script>

<template>
  <div class="mx-auto max-w-md space-y-6 p-6">
    <h1 class="text-2xl font-semibold">
      {{ t('title') }}
    </h1>

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
        {{ postError.statusMessage || postError.message }}
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
