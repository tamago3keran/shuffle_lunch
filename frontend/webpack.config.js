const path = require('path');

module.exports = {
  entry: {
    group_new: './src/javascripts/pages/groups/group_new.js',
    group_edit: './src/javascripts/pages/groups/group_edit.js',
    group_set_index: './src/javascripts/pages/group_sets/group_set_index.js',
    group_set_show: './src/javascripts/pages/group_sets/group_set_show.js',
    group_set_new: './src/javascripts/pages/group_sets/group_set_new.js',
    user_index: './src/javascripts/pages/users/user_index.js',
    user_new: './src/javascripts/pages/users/user_new.js',
    restaurant_show: './src/javascripts/pages/restaurants/restaurant_show.js',
    restaurant_index: './src/javascripts/pages/restaurants/restaurant_index.js',
    restaurant_new: './src/javascripts/pages/restaurants/restaurant_new.js',
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
        test: /\.scss$/,
        use: ['style-loader', 'css-loader', 'sass-loader'],
      },
    ],
  },
};
