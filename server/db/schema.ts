import {
  int,
  sqliteTable,
  text,
} from 'drizzle-orm/sqlite-core'

export * from './auth-schema'

export const usersTable = sqliteTable('users_table', {
  id: int().primaryKey({ autoIncrement: true }),
  name: text().notNull(),
  email: text().notNull().unique(),
})
