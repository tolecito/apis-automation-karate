Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url UrlBase
    * def utils = call read('classpath:utils/karate-functions.js')

    @obtenerUsuarios @regresion
  Scenario: get all users and then get the first user by id
    Given path 'users'
    And header Content-Type = 'application/json'
    When method get
    Then status 200

    * def first = response[utils.numeroAleatorio(10)]

    Given path 'users', first.id
    When method get
    Then status 200


    @crearUsuario @regresion
  Scenario Outline: crear usuario

      * def request_create_user = read('classpath:req/body/create-user.json')

    Given url 'https://jsonplaceholder.typicode.com/users'
    And request request_create_user
    When method post
      * print 'request body: ', request_create_user
      * print 'response: ', response
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

      @env=dev
    Examples:
      |read('classpath:data/CrearUsuario.csv')|

      @env=cert
    Examples:
      |read('classpath:data/CrearUsuario.csv')|

  