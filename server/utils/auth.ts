import type { H3Event } from 'h3'
import { drizzleAdapter } from 'better-auth/adapters/drizzle'
import { betterAuth } from 'better-auth/minimal'
import { authOptions } from '../../auth.config'
import * as schema from '../db/schema'

export function useAuth(event: H3Event) {
  return betterAuth({
    ...authOptions,
    database: drizzleAdapter(useDB(event), { provider: 'sqlite', schema }),
  })
}
