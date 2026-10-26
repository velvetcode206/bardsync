<script setup lang="ts">
const { t } = useI18n()

useSeoMeta({ title: t('pages.home.title') })

const {
  data,
  status,
  execute,
} = await useFetch('/api/users', { immediate: false })

const users = ref()

function getUsers() {
  execute()
  users.value = data.value
}

function clearUsers() {
  users.value = null
}
</script>

<template>
  <div class="page">
    <h1>{{ t('title') }}</h1>
    <p v-if="users">
      {{ users }}
    </p>
    <button :disabled="status === 'pending'" class="cursor-pointer" @click="getUsers()">
      Load
    </button>
    <button :disabled="status === 'pending'" class="cursor-pointer" @click="clearUsers()">
      Clear
    </button>
  </div>
</template>

<style scoped></style>
