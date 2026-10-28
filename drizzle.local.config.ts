import { readdirSync } from 'node:fs'
import { join } from 'node:path'
import { defineConfig } from 'drizzle-kit'

const dir = '.wrangler/state/v3/d1/miniflare-D1DatabaseObject'
const file = readdirSync(dir).find(f => f.endsWith('.sqlite') && f !== 'metadata.sqlite')

if (!file) {
  throw new Error('No local D1 file found. Run the local migrations first.')
}

export default defineConfig({
  dialect: 'sqlite',
  out: './migrations',
  schema: './server/db/schema.ts',
  dbCredentials: { url: join(dir, file) },
})
