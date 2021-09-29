module.exports = {
    devServer: {
      proxy: {
        '/api': {
          target: 'http://backend:80/',
          ws: true,
          pathRewrite: {
            '^/api': '/'
          }
        }
      }
    }
  }