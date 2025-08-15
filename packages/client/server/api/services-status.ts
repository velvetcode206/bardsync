export default defineEventHandler(async (_event) => {
  const services = ['auth']
  const data = await Promise.all(
    services.map(async (service) => {
      try {
        const response = await $fetch(`http://34.54.212.41/services/${service}`)
        return {
          service,
          status: response as string,
        }
      }
      catch (error) {
        return {
          service,
          status: (error as Error).message ?? 'Error',
        }
      }
    }),
  )
  return data
})
