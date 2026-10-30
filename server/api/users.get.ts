import { usersTable } from '../db/schema'

export default defineEventHandler(async (event) => {
  try {
    const db = useDB(event)
    return await db.select().from(usersTable)
  }
  catch (error) {
    throw createError({ statusCode: 500, statusMessage: `Failed to fetch users. ${error}` })
  }
})
