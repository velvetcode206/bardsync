import { usersTable } from '../db/schema'

export default defineEventHandler(async (event) => {
  try {
    const db = useDB(event)
    const body = await readBody(event)
    return await db.insert(usersTable).values(body).returning()
  }
  catch (error) {
    const cause = (error as Error).cause
    throw createError({
      statusCode: 500,
      statusMessage: `Failed to insert user. ${error}${cause ? ` | ${cause}` : ''}`,
    })
  }
})
