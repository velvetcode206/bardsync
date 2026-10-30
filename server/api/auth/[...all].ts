import { useAuth } from '#server/utils/auth'

export default defineEventHandler((event) => {
  return useAuth(event).handler(toWebRequest(event))
})
