<script setup lang="ts">
import type { NuxtError } from '#app'

defineProps<{ error: NuxtError }>()
</script>

<template>
  <NuxtLayout>
    <div>
      <h1>{{ error.status }}</h1>
      <h2>Oops, seems like there was an error.</h2>
      <NuxtLink to="/">
        Go back home
      </NuxtLink>
    </div>
  </NuxtLayout>
</template>

<style scoped></style>
