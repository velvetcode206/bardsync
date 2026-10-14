// @ts-check
import antfu from '@antfu/eslint-config'
import vueI18n from '@intlify/eslint-plugin-vue-i18n'
import withNuxt from './.nuxt/eslint.config.mjs'

export default withNuxt(
  antfu({
    vue: true,
    ignores: [
      '.nuxt/**',
      '.output/**',
      'dist/**',
      'node_modules/**',
      'pnpm-lock.yaml',
    ],
    formatters: true,
  }, {
    files: ['**/*.vue'],
    plugins: { '@intlify/vue-i18n': vueI18n },
    settings: {
      'vue-i18n': {
        localeDir: 'i18n/locales/*.{json,json5,yaml,yml}',
        messageSyntaxVersion: '^11.4.0',
      },
    },
    rules: {
      '@intlify/vue-i18n/no-raw-text': ['warn'],
      '@intlify/vue-i18n/no-html-messages': ['warn'],
      '@intlify/vue-i18n/no-v-html': ['warn'],
      '@intlify/vue-i18n/no-deprecated-tc': ['warn'],
      '@intlify/vue-i18n/no-missing-keys': ['warn'],
      '@intlify/vue-i18n/no-unused-keys': ['warn'],
    },
  }, {
    rules: {
      'node/prefer-global/process': ['off'],
      'object-curly-newline': ['warn', {
        multiline: true,
        minProperties: 3,
      }],
    },
  }),
)
