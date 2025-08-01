import antfu from '@antfu/eslint-config'

export default antfu({
  ignores: [
    './nx/**',
    './pnpm-lock.yaml',
    '**/node_modules/**',
    '**/dist/**',
  ],
  formatters: true,
}, {
  rules: {},
})
