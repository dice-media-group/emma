const { environment } = require("@rails/webpacker");

// added vue
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend("VueLoaderPlugin", new VueLoaderPlugin());
environment.loaders.prepend("vue", vue);

// added jquery to webpack
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jquery: 'jquery/src/jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
  })
)

module.exports = environment;
