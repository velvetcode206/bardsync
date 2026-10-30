import { defineRelations } from 'drizzle-orm'
import * as schema from './auth-schema'

export const relations = defineRelations(schema, r => ({
  // Auth relations
  user: {
    sessions: r.many.session(),
    accounts: r.many.account(),
  },
  session: {
    user: r.one.user({
      from: r.session.userId,
      to: r.user.id,
      optional: false,
    }),
  },
  account: {
    user: r.one.user({
      from: r.account.userId,
      to: r.user.id,
      optional: false,
    }),
  },
  // Custom relations
}))
