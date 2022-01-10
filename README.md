# Real State Portal

## A challenge for EasyBroker

### App characteristics

You can find this project deployed and working on https://real-state-portal.herokuapp.com/

#### Important version numbers

* Ruby version: 2.7.2
* Rails version: 6.1.4

#### How to run the test suite

* Run `rspec` for run all the tests.

#### External dependencies

* Need for https://api.stagingeb.com/ to be Online
* Status of connection to external Api can be checked at: https://real-state-portal.herokuapp.com/status/index

#### Deployment instructions

Deploy the App without any extra care, but make sure to set `EB_API_KEY` on enviroment or in `.env` file.

### Notes to EasyBroker Reviewers (in Spanish)

#### Decisiones
Un punto clave al inicio fué decidir si utilizar la Gema provista por EasyBroker o no.

Decidí no usarla, pero me fué complicado lograr filtrar las propiedades con el `status: published`.
Entonces le dí una oportunidad a la gema.

El problema del status se resolvió, pero, la libería no tiene el método para solicitar la página anterior de las propiedades.

Gasté casi un día en entender y extender la Gema para que cumpla mis requisitos, y no me gustó, así que volví
a la implementación sin la Gema y pude resolver el query del Status posteriormente.

Se prefirió aislar las peticiones a la Api externa en una clase aparte. Si bien se manejó como un servicio,
posiblemente fuera mejor dejarlo como un módulo.

Se implementó un endpoint dedicado a chequar el estado de la Api externa, el código del request del test es
independiente de la Clase que maneja los demás requests.

#### Parte con mayor dificultad
Se me dificultó un poco realizar la paginación, principalmente por falta de conocimientos.
No era una tarea que hubiese realizado a mano anteriormente, y en una App que tiene que traer los datos desde afuera.

#### Codigo poco 'limpio'
La paginación, y sus validaciones, más que nada el método `max_page_number` del controlador de Properties.
No me gusta para nada, no se entiende a simple vista que es lo que se pretende hacer.

La base de los requests, los métodos de la clase `EasyBrokerApi`, están poco ordenados, los métodos son poco reutilizables,
es necesario hacer que puedan transferir los argumentos de vuelta en la respuesta.
También faltó terminar de implementar la constante `API_URL` donde era necesaria.

Por algún motivo, el request del método `post_contact`, me costo hacerlo funcionar. No estoy seguro si no funciona
exactamente igual que los GET la formulación de la petición, o hubo algo extra que no supe ver.

#### Que falto hacer por falta de tiempo
Falto mucha limpieza y estilos.

El Gemfile tiene gemas que pensé usar y luego no usé, deberían ser eliminadas.
Las vistas y los estilos son muy precarios, con más tiempo podría haber intentado implementar Bootstrap, o al menos dejarlo mejor.

Más tests. Si bien se cubren algunos, y según la gema SimpleCov la cobertura es de un 97%, yo sé que hay muchas posibiidades que
no están contempladas. Los tests de las vistas son muy básicos. De hecho uno quedó fallando y no llegué a corregirlo.

Extender la clase EasyBrokerApi más para limpiar el controlador principal.

### Comentarios

El proyecto estuvo bueno, me hubiese gustado poder extender la Gema de EasyBroker en sí misma para contribuir a la misma.

Creo que la parte de chequear los status de las propiedades en la Api es un poco rebuscada. También me trajo algún contratiempo
el hecho de que la Api devuelva un HttpCode `200`, pero el contenido es para nada el esperado. 

Este comportamiento puede verse al visitar una página inexistente, como https://api.stagingeb.com/v1/v 

¡Gracias por la oportunidad y a seguir aprendiendo todo lo que noté que me falta!

