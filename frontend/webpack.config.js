const path = require('path');

module.exports = {
  mode: 'development',

  entry: {
    hello: './src/javascripts/Hello.js',
  },

  output: {
    filename: '[name].bundle.js',
    path: path.join(__dirname, '../app/assets/javascripts/packs'),
  },

  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: ['@babel/preset-env'],
            },
          },
        ],
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
};
