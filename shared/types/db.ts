import type { usersTable } from '#server/db/schema'

export type User = typeof usersTable.$inferSelect
