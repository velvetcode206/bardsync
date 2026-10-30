import type { BetterAuthOptions } from 'better-auth/minimal'
import { drizzleAdapter } from 'better-auth/adapters/drizzle'
import { betterAuth } from 'better-auth/minimal'

export const authOptions = { emailAndPassword: { enabled: true } } satisfies BetterAuthOptions

/**
 * Empty database on purpose. This export is only useful for generating better-auth schema.
 *
 * `pnpm dlx auth@latest generate --config auth.config.ts --output server/db/auth-schema.ts`
 */
export const auth = betterAuth({
  ...authOptions,
  database: drizzleAdapter({} as any, { provider: 'sqlite' }),
})
