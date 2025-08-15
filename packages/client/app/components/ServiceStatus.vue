<script setup lang="ts">
const { data } = await useFetch('/api/services-status')
</script>

<template>
  <div class="services-status">
    <p v-for="service in data" :key="service.service">
      <a :href="`http://34.54.212.41/services/${service.service}`" style="text-transform: capitalize; text-decoration: underline; color: blue">{{ service.service }}:</a>
      {{ service.status }}
    </p>
  </div>
</template>

<style scoped>
.services-status {
  display: flex;
  flex-direction: column;
  gap: 8px;
  padding: 32px 0;
  align-items: center;
  width: 100%;
  color: black;
}
</style>
