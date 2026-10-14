import type { Config } from 'tailwindcss'

export default <Partial<Config>>{
  theme: {
    extend: {
      colors: {
        primary: { DEFAULT: '#222222' },
        secondary: { DEFAULT: '#eeeeee' },
        accent: { DEFAULT: '#7B3FB2' },
      },
      fontFamily: { roboto: ['Roboto', 'sans-serif'] },
    },
  },
}
