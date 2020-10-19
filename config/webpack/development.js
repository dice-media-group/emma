process.env.NODE_ENV = process.env.NODE_ENV || "development";

const environment = require("./environment");

// dotenv for exposing values for ngrok
const dotenv = require("dotenv");

dotenv.config({ path: ".env", silent: true });

const ngrokTunnel = process.env.ASSET_TUNNEL_URI;

environment.config.merge({
  devServer: {
    public: ngrokTunnel,
  },
});

module.exports = environment.toWebpackConfig();
