const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Roboto'],
        title: ['Montserrat'],
      },
      colors: {
        'carnation-pink': {
          DEFAULT: '#FEACC2',
          50: '#FFF0F4',
          100: '#FFE8EE',
          200: '#FFD9E3',
          300: '#FECAD8',
          400: '#FEBBCD',
          500: '#FEACC2',
          600: '#FD7599',
          700: '#FD3D71',
          800: '#FC0648',
          900: '#C70237',
        },
        'biloba-flower': {
          DEFAULT: '#CAADEF',
          50: '#FFFFFF',
          100: '#FFFFFF',
          200: '#FFFFFF',
          300: '#F6F1FC',
          400: '#E0CFF6',
          500: '#CAADEF',
          600: '#AC7EE6',
          700: '#8D4FDD',
          800: '#7028CC',
          900: '#561F9D',
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ],
}
