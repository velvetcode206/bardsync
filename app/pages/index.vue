<script setup lang="ts">
const { t } = useI18n()

useSeoMeta({ title: t('pages.home.title') })
</script>

<template>
  <div class="page">
    {{ t('title') }}
  </div>
</template>

<style scoped></style>
