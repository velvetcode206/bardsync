import type { H3Event } from 'h3'
import { drizzle } from 'drizzle-orm/d1'
import { relations } from '../db/relations'

export function useDB(event: H3Event) {
  return drizzle(event.context.cloudflare.env.DB as D1Database, { relations })
}
