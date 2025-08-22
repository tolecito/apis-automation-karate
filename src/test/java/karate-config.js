function fn() {
  var env = karate.env;
  var UrlBase = ''
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
  }

  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    UrlBase = 'https://jsonplaceholder.typicode.com'

  } else if (env == 'cert') {
    // customize
    UrlBase = 'https://jsonplaceholder.typicode'
  }

  var config = {
      env: env,
      myVarName: 'someValue',
      UrlBase: UrlBase
  }

  return config;
}