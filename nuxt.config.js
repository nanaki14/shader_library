const pkg = require('./package')

module.exports = {
  mode: 'spa',

  /*
  ** Headers of the page
  */
  head: {
    title: 'Shader Practice',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content: 'nanaki14が書いたシェーダーを載せていくだけのサイトです。'
      },
      {
        hid: 'og:title',
        property: 'og:title',
        content: 'Shader Practice'
      },
      {
        property: 'og:type',
        content: 'website'
      },
      {
        hid: 'og:url',
        property: 'og:url',
        content: 'https://shader-practice.netlify.com/'
      },
      {
        property: 'og:description',
        content: 'nanaki14が書いたシェーダーを載せていくだけのサイトです。'
      },
      {
        name: 'twitter:card',
        content: 'summary'
      },
      {
        hid: 'twitter:title',
        name: 'twitter:title',
        content: 'Shader Practice'
      },
      {
        name: 'twitter:description',
        content: 'nanaki14が書いたシェーダーを載せていくだけのサイトです。'
      }
    ],
    link: [
      {
        rel: 'icon',
        type: 'image/png',
        href: '/favicon-16.png',
        sizes: '16x16'
      },
      {
        rel: 'icon',
        type: 'image/png',
        href: '/favicon-32.png',
        sizes: '32x32'
      },
      {
        rel: 'stylesheet',
        href: 'https://fonts.googleapis.com/css?family=Charm'
      }
    ]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },

  /*
  ** Global CSS
  */
  css: ['@/assets/scss/foundation/_reset.scss', '@/static/fonts/style.css'],

  /*
  ** Plugins to load before mounting the App
  */
  plugins: [],

  /*
  ** Nuxt.js modules
  */
  modules: [
    [
      'nuxt-sass-resources-loader',
      [
        '@/assets/scss/foundation/_variable.scss',
        '@/assets/scss/foundation/_mixin.scss',
        '@/assets/scss/foundation/_function.scss'
      ]
    ]
  ],

  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push(
          {
            enforce: 'pre',
            test: /\.(js|vue)$/,
            loader: 'eslint-loader',
            exclude: /(node_modules)/
          },
          {
            test: /\.glsl$/,
            loader: 'webpack-glsl-loader'
          }
        )
      }
    }
  }
}
