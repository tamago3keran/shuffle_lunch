const path = require('path');

module.exports = {
  entry: {
    group_set_index: './src/javascripts/pages/group_sets/group_set_index.js',
    group_set_show: './src/javascripts/pages/group_sets/group_set_show.js',
    user_index: './src/javascripts/pages/users/user_index.js',
    user_new: './src/javascripts/pages/users/user_new.js',
    restaurant_show: './src/javascripts/pages/restaurants/restaurant_show.js',
    restaurant_edit: './src/javascripts/pages/restaurants/restaurant_edit.js',
    restaurant_index: './src/javascripts/pages/restaurants/restaurant_index.js',
    restaurant_new: './src/javascripts/pages/restaurants/restaurant_new.js',
    login: './src/javascripts/pages/admin/login.js',
    group_edit: './src/javascripts/pages/admin/group_edit.js',
    admin_group_set_index: './src/javascripts/pages/admin/group_sets/group_set_index.js',
    admin_group_set_new: './src/javascripts/pages/admin/group_sets/group_set_new.js',
    admin_group_set_show: './src/javascripts/pages/admin/group_sets/group_set_show.js',
    admin_group_edit: './src/javascripts/pages/admin/group_edit.js',
    admin_group_new: './src/javascripts/pages/admin/group_new.js',
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
