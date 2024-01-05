const path = require('path');

module.exports = {
  entry: './app/javascript/packs/application.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
  resolve: {
    extensions: ['.js', '.json'],
    alias: {
      'raty.js': path.resolve(__dirname, 'app/javascript/packs/raty.js'),
    },
  },
};
