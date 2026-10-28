import tailwindcss from '@tailwindcss/vite'
import { createResolver } from 'nuxt/kit'

const { resolve } = createResolver(import.meta.url)

export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },
  nitro: {
    preset: 'cloudflare-module',
    cloudflare: {
      deployConfig: false,
      nodeCompat: true,
    },
  },
  vite: {
    plugins: [
      tailwindcss(),
    ],
  },
  app: {
    head: {
      htmlAttrs: {
        lang: 'en-US',
        dir: 'ltr',
      },
      titleTemplate: '%s · Bardsync',
      meta: [
        { charset: 'utf-8' },
        {
          name: 'viewport',
          content: 'width=device-width, initial-scale=1',
        },
        {
          name: 'description',
          content: 'Bardsync · Play sound effects and music in perfect sync, with everyone, everywhere.',
        },
      ],
    },
    pageTransition: {
      name: 'fade',
      mode: 'out-in',
    },
    layoutTransition: {
      name: 'fade',
      mode: 'out-in',
    },
  },
  css: [
    '~/assets/css/main.css',
    '~/assets/css/font.css',
    '~/assets/css/transition.css',
  ],
  modules: [
    '@nuxt/eslint',
    '@nuxt/image',
    '@nuxtjs/i18n',
    '@nuxt/icon',
    '@vueuse/nuxt',
    '@nuxtjs/sitemap',
    '@nuxtjs/robots',
    '@pinia/nuxt',
    'nitro-cloudflare-dev',
  ],
  eslint: { config: { standalone: false } },
  image: { dir: 'assets/images', quality: 80 },
  i18n: {
    defaultLocale: 'en-US',
    locales: [
      {
        code: 'en-US',
        name: 'English (US)',
        file: 'en-US.yml',
      },
      {
        code: 'pt-BR',
        name: 'Português (Brasil)',
        file: 'pt-BR.yml',
      },
    ],
  },
  icon: {
    provider: 'server',
    customCollections: [
      {
        prefix: 'custom',
        dir: resolve('./app/assets/icons'),
        recursive: true,
        normalizeIconName: false,
      },
    ],
  },
  vueuse: {},
  site: {
    url: 'https://bardsync.pages.dev/',
    name: 'Bardsync',
    trailingSlash: true,
  },
  robots: { blockAiBots: true },
  pinia: {},
})
