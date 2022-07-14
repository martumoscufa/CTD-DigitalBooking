# Proyecto Integrador
## Equipo 10 - Camada 5

A continuación se encuentra el registro de los casos de prueba, así como su ejecución y reporte de defectos. Wiki en proceso.

- [Ver Diseño de Casos de Prueba](https://docs.google.com/spreadsheets/d/1Kvc3_fCeGb0A4HWTVpRMb6S4nM5MKCGgxZAjjX6mLs0/edit?usp=sharing).

- Para acceder a la app y probar la validación de datos, se han estado utilizando los dos primeros sprints el username **user@gmail.com** y la contraseña **user123**

- Las pruebas automatizadas se encuentran en la rama testing, guardadas en la carpeta de testing. Se encontrarán los resultados de postman y Jest, divididos por sprint.



![](Aspose.Words.8863d183-b441-4260-be1c-c3324b12d540.001.png)![](Aspose.Words.8863d183-b441-4260-be1c-c3324b12d540.002.png)
## Digital Booking

**Un resumen general de qué consiste el proyecto:**
El proyecto se enfoca en generar una experiencia de cursada que replica un escenario laboral real y la cultura de la industria tecnológica. Esto nos permite así poder integrar los principales conocimientos y habilidades de los bimestres anteriores y de las metodologías de trabajo. Para ello, se plantearon 4 sprints en los que se fue realizando el trabajo integrador de forma grupal, en donde cada integrante del grupo ocupó diferentes roles para la creación del mismo.![](Aspose.Words.8863d183-b441-4260-be1c-c3324b12d540.003.png)


El objetivo final del proyecto integrador consiste en desarrollar una página web de reserva de alojamientos desde cero, generando el frontend, el backend, la infraestructura y su correspondiente testeo, aplicando la metodología ágil SCRUM, aprendida a lo largo de la cursada.

**Objetivo que persigue el grupo al realizar el proyecto:**
Los objetivos que persiguió el grupo al realizar el proyecto fueron diversos. Por un lado, nos enfocamos en poder aplicar los conocimientos vistos en este primer año de la carrera, pero también fue una experiencia que nos permitió aprender haciendo, desarrollar habilidades técnicas y blandas, como el trabajo en equipo, la creatividad, la responsabilidad, el compromiso, la comunicación efectiva y la autonomía.
## Equipo
#### David, Ronald
Una breve descripción o biografía del integrante comentando qué conocimientos tenía al iniciar la carrera.

Mi nombre es Ronald David, vivó en Colombia, tengo 34 años, soy Tecnólogo en Programación (2009)  e Ingeniero de Sistemas (2014). Mi perfil profesional ha estado enfocado en el desarrollo de aplicaciones web con PHP y MYSQL, y administrador de VPS para el despliegue de las mismas. Actualmente, brindó asesoría para instituciones educativas de primaria y secundaría en la sistematización de sus procesos académicos, además de ayudarles en la implementación de LMS (Moodle) para la gestión de sus actividades académicas. 

Una breve descripción de los roles desempeñados y las tareas realizadas durante los diferentes sprints.

**Rol Infraestructura (principal):**

**Sprint 1**: Con base a los requerimientos de las tecnologías a usar para el desarrollo del proyecto se presentó un boceto de infraestructura en aws, el cual, incluía una instancia para la app de ReactJS, otra instancia para la api  de Spring Boot y un servicio RDS para la base de datos MYSQL sin acceso al público.

**Sprint 2**: Se implementó el boceto del Sprint 1. Una instancia con nginx para la aplicación de ReactJS con ip publica para su acceso, otra instancia con java 17.0 para la api de Spring Boot con ip pública y acceso por el puerto 8080. Se creó una instancia de RDS con mysql 5.7 por el 3306 sin acceso fuera de la VPC. Y por último se creó el servicio S3 de acceso público para almacenar las imágenes a usar en el proyecto. 

**Sprint 3**: Se crearon los pipeline de CI/CD con los stage para frontend  y backend en gitlab permitiendo al equipo estar probando continuamente las mejoras y encontrar los errores. Adicionalmente, se configuró el acceso del backend al servicio RDS de mysql; la implementación de las tablas no fue necesario porque SpringBoot mediante JPA se encarga de gestionarla.

**Sprint 4**: En esta etapa final del proyecto, se automatizó la infraestructura con terraform y se adquirió el dominio bookingdh.xyz en  <https://www.namecheap.com/> y se gestiona desde aws. 

Desde la consola de aws se implementaron los siguientes servicios:

- Amazon S3 Bucket para almacenar los artefactos de backend y frontend, que luego serán accedidos por las instancias Ec2.
- Amazon SES Mail para enviar emails a los usuarios cuando se registran, cambio de password y confirmación del cambio.
- Amazon Route 53 para gestionar el dominio del proyecto bookingdh.xyz
- Amazon Certificate Manager para gestionar un certificado https para el dominio bookingdh.xyz y el subdominio api.bookingdh.xyz.

Y desde terraform se implementó la infraestructura necesaria para el deploy de la app de frontend y de la api de backend, haciendo uso de los siguientes elementos:

- VPC que engloba toda la red.
- Subnets en la zona de disponibilidad US-WEST-2.
- Security Group para manejar la seguridad de los recursos.
- Applications Load Balancer para distribuir automáticamente el tráfico entrante entre varias instancias EC2.
- Auto Scaling Group para administrar el aprovisionamiento de recursos de acuerdo al consumo de nuestras aplicaciones.
- Route 53 para gestionar el enlace entre el dominio bookingdh.xyz y api.bookingdh.xyz de cada uno de los Aplications Load Balancer.
- Servicio RDS para la base de datos del proyecto en el motor MYSQ 5.7.

**Rol Backend y Base de datos:**

**Sprint 1**: Colaboré en el diseño inicial del modelo entidad relación de la base de datos en MySql, he implementado testing unitario a las primeras clases del modelo.

**Sprint 3**: Colaboré en los endpoints para la gestión de roles, usuarios y permisos, además de la implementación de Spring Security para la autenticación por medio de jwt.

**Sprint 4**: Colaboré en la implementación de envio de mail a través del servicio de AWS con Amazon SES Mail en spring boot. La activación de cuenta de los usuarios por medio de envío de email a su correo, cambio de contraseña por medio de un hash que se envía al mail del usuario y su posterior cambio de contraseña con notificación de cambio a su email. 

**Rol Frontend:**

**Sprint 2**: Colaboré en la creación de Context para el manejo de los datos de usuario de manera global en toda la aplicación de reactjs y su autenticación.

**Sprint 3**: Colaboré en el ruteo de las aplicaciones haciendo uso de los estados almacenados en el Context: en caso de una reserva sin logueo, enviar el usuario al login y posteriormente regresarlo al servicio para completar la reserva.

**Sprint 4**:Colaboré en la implementación de request y response para la activación de cuenta de usuario por medio del envío de email, cambio de password consumiendo el endpoint de la api, y la creación de la ruta en reactjs donde se recibe el hash que habilita el cambio de password, igualmente el consumo del endpoint para registrar el nuevo password. 

Una tabla indicando las fortalezas actuales en las principales áreas de tecnología de la carrera.

|**Tecnología**|**Fortaleza**|
| :-: | :-: |
|Front end|🔵 🔵 ⚪|
|Back end|🔵 🔵 🔵|
|Infraestructura|🔵 🔵 🔵|
|Testing / QA|🔵 🔵 ⚪|
|Bases de datos|🔵 🔵 🔵|
##
#### Elorza, Tatiana
Una breve descripción o biografía del integrante comentando qué conocimientos tenía al iniciar la carrera.

Mi nombre es Tatiana Elorza, tengo 26 años y estudio la carrera de Licenciatura en Bioinformática. Mi carrera me permitió tener un primer acercamiento con la programación y adquirir conocimientos sólidos de POO en el lenguaje C++.

(Preguntar si hay que poner algo más personal)

Durante todos los sprint desarrolle principalmente el rol de backEnd armando la api posteriormente consumida por el área de frontEnd. En el área de frontEnd desarrolle funcionalidades para la página y consumos de la API.

Sprint 1: BackEnd/FrontEnd. 

BackEnd: Realizamos, junto con mi compañera en el área Stephanie, la tabla de Categorías junto con su repositorio, su servicio y su controlador. Desde el primer sprint tratamos de hacer los controladores lo más eficientes para que el consumo desde frontEnd sea lo más sencillo e intuitivo posible.

FrontEnd: Realizamos las funcionalidades de la página, como por ejemplo el mostrar y ocultar la contraseña de los formularios de new account y log in clickeando el icono del ojo, el consumo de la api de categorías para poder ver las categorías que tenía nuestra base de datos, entre otras. 

Sprint 2: 

BackEnd:

FrontEnd:

Sprint 3: 

BackEnd:

FrontEnd:

Sprint 4: 

BackEnd: Realizamos todas las tablas y funcionalidades optativas de sprint anteriores, las cuales no priorizamos durante los sprints. Y terminamos de ultimar detalles de los DTOs y se agregaron los endpoints necesarios.

FrontEnd: Realizamos la página con todos los datos de un usuario (sus datos personales, sus reservas y sus alojamientos favoritos) con su responsive para desktop, tablet y mobile. Arreglamos detalles y errores que quedaron de sprints pasados.

Una breve descripción de los roles desempeñados y las tareas realizadas durante los diferentes sprints.

Una tabla indicando las fortalezas actuales en las principales áreas de tecnología de la carrera.?????

####
#### Ferrarino, Chiara
Una breve descripción o biografía del integrante comentando qué conocimientos tenía al iniciar la carrera.

Una breve descripción de los roles desempeñados y las tareas realizadas durante los diferentes sprints.

Una tabla indicando las fortalezas actuales en las principales áreas de tecnología de la carrera.

####
#### Moscufa, Martina
**Conocimientos previos a comenzar la carrera:**

Conocimientos de C++, C#, Visualbasic y SqlServer. Los cuales adquirí en la carrera de técnico universitario en programación de la universidad tecnológica nacional.

En diciembre del 2020 hice un curso de 3 meses de la universidad tecnológica nacional Facultad regional de resistencia de desarrollo de videojuegos, en donde aprendí a usar blender para modelar personajes y objetos en 3D, unity como motor del juego y VisualStudio utilizando C# como lenguaje.

**Resumen del bimestre:**

|Sprint|Rol / Roles|Tareas realizadas|
| :-: | :-: | :-: |
|1 <br>Home y Login|Frontend|<p>` `Planificación de la maqueta en diagrams.net:<br>`     `-Header, Body y Footer<br>`     `-Login y Crear cuenta</p><p>` `Maquetación y estilo del mismo utilizando css.</p><p>` `Responsividad para Desktop, Tablet y Mobile.<br>` `Validaciones de logueo y crear cuenta.</p>|
|2<br>Detalle de producto|Frontend|<p>` `Planificación de la maqueta en diagrams.net:<br>`     `-Detalle de producto</p><p>` `Maquetación y estilo del mismo utilizando css</p><p>` `Responsividad para Desktop, Tablet y Mobile.</p>|
|3<br>Reserva de producto|<p>Frontend<br>Testing</p><p>Base de datos</p>|<p>` `Planificación de la maqueta en diagrams.net:<br>`     `-Reserva de producto</p><p>` `Maquetación y estilo del mismo utilizando css</p><p>` `Responsividad para Desktop, Tablet y Mobile.<br>` `Debugging de errores de sprints pasados.<br>` `Subida de productos utilizando postman</p>|
|4<br>Alta de producto|<p>Frontend</p><p>Testing</p><p>Base de datos</p>|<p>` `Planificación de la maqueta en diagrams.net:<br>`     `-Alta de producto</p><p>` `Maquetación y estilo del mismo utilizando css</p><p>` `Responsividad para Desktop, Tablet y Mobile.<br>` `Debugging de errores de sprints pasados.<br>` `Subida de productos utilizando MySQL</p>|

[Planificación de maquetado - Digital Booking - Proyecto Integrador](https://drive.google.com/file/d/1mZ0Rmfy9-x5iNWLmFxjBENNdaxtrQq2B/view?usp=sharing)

En cuanto a las fortalezas, me destaco en el área de Frontend en todo lo que es maquetado, estilo y responsividad para diferentes tipos de dispositivos. 
####
#### Oroná, Yohana
Una breve descripción o biografía del integrante comentando qué conocimientos tenía al iniciar la carrera.

Mi nombre es Yohana ,soy mamá de Mía y emprendedora. Comencé estudiando hace unos años en Digital House la carrera de Full Stack, la cual me fué de ayuda para conocer los fundamentos básicos de la programación, pero sentía que necesitaba un “refuerzo” sobre esos primeros pasos y fué así que me postule a esta beca.

Una breve descripción de los roles desempeñados y las tareas realizadas durante los diferentes sprints.

Me desempeñé principalmente en el rol de Frontend y colaboraciones en Base de Datos.

Sprint 1: Durante este Sprint se realizó una planificación y maquetado sobre el desarrollo del Frontend. Comenzamos con el maquetado del mismo para lo cual utilizamos Draw.io , siguiendo los requerimientos planteados por el Product Owner y siguiendo la estética de Figma.

Dividimos la realización de los componentes para llegar con el tiempo requerido del Sprint.

Unas de la tareas fué la realización del  calendario doble para indicar fecha inicial y final de la reserva a realizar .

Para programar el Frontend utilizamos JavaScrip y React. 

`  `(En esta etapa también se consideró que lo más adecuado para desarrollar tanto el frontend como el backend era realizarlo en inglés).

Sprint 2: En este sprint la organización fué similar al el primero ya que se diseñaron los componentes en Draw.io y se dividieron las tareas con Martina Muscufa.

Dentro de varias tareas, se realizó una galería de imágenes con diferentes formatos dependiendo el dispositivo donde se visualizará. Este mismo cuenta con un botón de  “ver mas” donde se aplica un modal que mostrará un carrousel, con diferentes funcionalidades.

También implementé el mapa de Google Maps, utilizando la Api del sitio, dándole las características necesarias programando la lógica que aplicará para las funcionalidades requeridas en este Sprint.

Sprint 3: Durante este Sprint se realizó el componente de “Reserva de Productos”. Se logró implementar una ruta protegida para chequear si la persona esta logueada y avanzar al componente donde se visualiza los detalles de la reserva.

Se realizó la automatización de calendario de “Detalle de producto” ( requerimiento de Sprint 2) para que el detalle de la fecha elegida para la reserva se visualice en el bloque de “Detalle de Reserva”, en el cual realicé todo el bloque del mismo con la lógica establecida .

También se realizó una pequeña animación al terminar la validación de la reserva. 

Sprint 3: En este sprint se creó el “Formulario  de creación de producto”, el mismo previamente se diseñó en Draw.io y nos dividimos los requerimientos del sprint.

Realicé un  checkbox el cual contiene las amenities del hospedaje. Los atributos son consumidos desde la base de datos para ser visualizados en el Frontend.

Al mismo tiempo se implementa la selección de cantidad de estrellas como identificativo de servicios e instalaciones que pone a disposición del huésped el administrador.

Como chequeo final se realiza una animación en corazón de favoritos y el componente final de subida exitosa de parte del administrador. 

Una tabla indicando las fortalezas actuales en las principales áreas de tecnología de la carrera.

Con respectos a las fortalezas en las cuales me puedo destacar es el área de Frontend, todo lo que implica, el maquetado, la utilización de APIs, animaciones de y funcionalidades. Por otro lado, en Base de Datos puede aportar mis conocimientos para la  carga de información.

####
#### Righetti, Stephanie
Una breve descripción o biografía del integrante comentando qué conocimientos tenía al iniciar la carrera.

Mi nombre es Stephanie y tengo 25 años. Antes de iniciar la carrera, tenía conocimientos básicos sobre los fundamentos de programación, habiendo realizado el curso brindado por el Ministerio de Desarrollo Productivo “Argentina Programa”. A su vez incursioné en algunos cursos sobre Python.

Una breve descripción de los roles desempeñados y las tareas realizadas durante los diferentes sprints.

A lo largo de los cuatro sprints, me desempeñé mayoritariamente en los roles de bases de datos y backend. No obstante, también he colaborado con algunas pequeñas tareas en el área de frontend cuando fue necesario.

Sprint 1: Durante este Sprint se realizó una planificación sobre el desarrollo del backend en conjunto con un diseño de la base de datos, siguiendo los requerimientos propuestos en el backlog. También se decidió que el patrón adecuado para el trabajo integrador era el de Modelo-Vista-Controlador. De este modo, se procedió a ordenar en carpetas distintas los repositorios, los servicios, las entidades y los controladores para un desarrollo más óptimo cuando la aplicación escalase. El lenguaje de programación utilizado para el desarrollo del backend fue Java y se empleó el framework Spring Boot. En base a eso, junto a mi compañera, nos dedicamos a la creación de la tabla de Categorías, y su respectivo repositorio, servicio y controlador para que pueda ser posteriormente consumido desde el frontend. 

En esta etapa también se consideró que lo más adecuado para desarrollar tanto el código del frontend como el del backend era en inglés.

Sprint 2: Para el segundo Sprint decidimos mantener la planificación del diseño de las tablas al comienzo del mismo para ordenar las relaciones entre ellas antes de volcarlas directamente al código. Para ello utilizamos primero la herramienta de draw.io y posteriormente la herramienta que provee MySQL de ingeniería reversa. Las tareas de este Sprint incluyeron: la creación de una entidad Productos con sus respectivos atributos, que permitiera crear, listar y buscar por id. A su vez, se pidió que esta entidad tuviese alguna relación con la tabla de Categorías y se optó por establecer una relación de uno a muchos. Se creó la tabla de Ciudades, a requerimiento del Sprint, pero a esta se le anexó la tabla de Países (relación de uno a muchos) para evitar repeticiones. A su vez, se creó la tabla de Políticas y se le anexó la tabla de Políticas Tipo, ya que en base al diseño de Figma pudimos identificar que había únicamente tres tipos a los cuales se le asociaban el resto de las políticas generales. Luego se creó la tabla de Imágenes, también asociada a Productos en una relación de muchos a uno. Por último, se creó la tabla de Características, a la cual se le añadió una tabla intermedia de “Producto tiene Características” debido a que muchos productos pueden tener más de una característica, lo cual vuelve más eficiente el almacenamiento de los datos. 

Luego, se realizó gracias a Hibernate el mapeo correspondiente de las tablas de Imágenes y Ciudades con las clases de nuestro modelo. Se realizó a su vez la creación de los repositorios, servicios y controladores de aquellas entidades que el frontend necesitaba consumir.

Otro de los requerimientos involucró la creación de ciertos métodos que el frontend necesitaba implementar en el home de la página web. Uno de ellos fue el despliegue de productos aleatorios en el home si el usuario no está logueado. A su vez, también se realizó el filtro por ciudad en el buscador de la página y el filtro por categoría de los productos. Para este sprint, las APIs empezaron a ser consumidas desde el frontend por lo que se realizó la conexión con el backend.

Sprint 3: Para el tercer sprint, la división de tareas en el área backend se realizó entre tres integrantes del grupo. En mi caso, me focalicé puntualmente en la creación de un método que permitiese el filtro de producto por ciudad y un rango de dos fechas desde la página principal. A su vez, participé en la creación de la tabla de Usuarios y Reservas con sus respectivas relaciones. Estas tablas fueron posteriormente mapeadas con clases ya existentes en nuestro modelo. Se creó a su vez el endpoint de reservas que permitía la búsqueda de reservas por id y la creación de las mismas.

Sprint 4:  Para el cuarto sprint, lo que se hizo fue una mejora de los métodos ya empleados y se corrigieron aquellas cosas que consideramos que podrían implementarse de una mejor manera. A su vez, se decidió realizar algunas tareas electivas, como la creación de la tabla de Puntajes y Favoritos. 

En este sprint también colaboré con el frontend armando un Skeleton para cuando la página estuviese cargando y realicé un poco de refactorización de código. 

Una tabla indicando las fortalezas actuales en las principales áreas de tecnología de la carrera.

En cuanto a las fortalezas, considero que aquello en lo que mejor me desenvuelvo es el área de backend y bases de datos. No obstante, también cuento con conocimientos que me permitieron realizar aportes en el área de frontend cuando fue necesario.
##
## Metodología de trabajo
Completar esta sección respondiendo a las siguientes consignas:

- Breve explicación de la metodología de trabajo utilizada (Scrum), indicando los puntos que les hayan resultado positivos y / o negativos.

La metodología de trabajo utilizada durante el proyecto integrador fue Scrum. Scrum es un framework que se enmarca dentro de las metodologías ágiles, ya que se genera valor iteración a iteración. 

Se trabajó durante cuatro sprints para el desarrollo del producto, en los cuales tuvimos dailys, weeklys, reviews y retros.

Aquello que encontramos positivo fue: 

- El constante contacto con tu equipo, lo que nos permitió saber cómo se iban desarrollando las issues que manejaba cada integrante. 
- Se potenció el trabajo colaborativo. 
- Se generaron vínculos más fuertes entre los integrantes del equipo. 
- Nos permitió sprint a sprint poder entregar un producto mínimo viable óptimo. 
- También permitió una actualización constante y contínua de los pedidos del cliente.

Aquello que encontramos negativo fue:

- La cantidad de tiempo propuesta para cada ceremonia, ya que en algunos casos consideramos que tal vez hubiese sido más productivo que fuesen reuniones más cortas en diferentes días y que no nos quitaran demasiado tiempo para la realización de las tareas.
- Tal fue el caso de la Retro, que consideramos que podría haberse desarrollado otro día para permitirnos llegar con más tiempo a las entregas.
- Validación del sprint.

- Explicación de cómo manejaron la asignación de roles dentro del equipo (si los hubo) y cómo se organizaron a la hora de repartir las tareas.

La asignación de roles se realizó durante los primeros días del primer sprint, sin problemas a la hora de la asignación de roles a cada persona. A su vez los roles no fueron fijos, y no hubo resistencia a la hora de realizar tareas de otras áreas. 

A la hora de repartir tareas se priorizaron las tareas más importantes teniendo en cuenta las capacidades de cada uno. 

- Opcionalmente pueden describir otros acuerdos a los que hayan llegado para trabajar en equipo, gestionar el control de versiones, normalizar el código producido, etc.

Uno de los acuerdos a los que llegamos a la hora de trabajar en equipo fue la utilización de branches en la que generalmente trabajaron en simultáneo como máximo dos personas. De esta forma, y con la división de tareas, nos resultó más fácil manejar los conflictos y tomar decisiones sobre el código producido. No obstante, siempre nos comunicamos como equipo a la hora de tomar decisiones fundamentales, generalmente en el espacio de las dailies. 
##
## Bitácora del proyecto
Completar esta sección respondiendo a las siguientes consignas:

- Describir cómo vivieron cada sprint, qué desafíos se encontraron y cómo resolvieron los requerimientos obligatorios y opcionales.
  - Pueden utilizar y referenciar el resultado de las dailies y las retros para este punto.
- Resumir las fortalezas del equipo y cómo supieron aprovecharlas para avanzar de mejor manera.
  - Contar puntualmente algo que consideren que haya sido un éxito dentro del equipo / desarrollo.
- Resumen de debilidades del equipo y cómo resolvieron situaciones difíciles o conflictivas.
  - Contar puntualmente algo que consideren que haya salido mal, cómo lo resolvieron y qué aprendieron como consecuencia.

Cómo vivimos cada sprint:

El primer y segundo sprint fueron los más difíciles como equipo porque tuvimos que acostumbrarnos a trabajar de manera simultánea y colaborativa en el repositorio. A su vez, a lo largo de estos dos sprints, sufrimos la baja de dos compañeras que se encontraban enfermas y hubo que suplir sus roles para poder llegar con los requerimientos pactados. Tuvimos que aprender también a negociar con qué cosas llegábamos y con qué no para poder entregar un producto más óptimo sin comprometer la salud mental de los integrantes.

(Falta tercer y cuarto sprint)

En cuanto a las entregas optativas, tomamos la decisión de dejarlas pendientes para el último sprint, para poder cumplir al 100% con aquellos requerimientos obligatorios del proyecto. Consideramos que fue mejor entregar un MVP funcional iteración a iteración antes que agregar funcionalidades extras que, si bien embellecen la página y la hacen más completa, no eran requeridas por parte del Product Owner.

Fortalezas del equipo: 

Resultamos ser un equipo muy colaborativo y comunicativo, lo que nos permitió llegar a acuerdos colectivos a la hora de tomar decisiones y también cuando hubo que hacer división de tareas. Esto es algo que consideramos un gran éxito y que creo que todos nos llevamos como aprendizaje fundamental.  A su vez, consideramos que somos un equipo muy proactivo, en el que nunca faltaron ganas de trabajar y organizarse pese a las dificultades que surgieron en el camino. Cada integrante del equipo supo aportar sus conocimientos (tanto técnicos como humanos) para llevar adelante el trabajo.

Debilidades del equipo:

Una de las debilidades que encontramos durante la primera instancia del proyecto fue la utilización de ramas en Gitlab para poder trabajar de manera conjunta. Eso fue algo que pudimos mejorar para el segundo Sprint y fue algo que mantuvimos a lo largo del proyecto. Por otro lado, también tuvimos dificultades a la hora de exponer en la primera review. No obstante, eso también fue algo que mejoramos en los subsiguientes sprints, en donde nos manejamos de forma más ordenada y practicamos con más tiempo antes de realizar la exposición.  Lo mismo sucedió a la hora de pedir ayuda a los TLs. Si bien fue algo que hicimos desde el primer momento, creo que hubieron situaciones en las que hubiésemos podido resolver dudas mucho más rápido si las consultábamos antes.
##
## Tecnologías utilizadas
Completar esta sección respondiendo a las siguientes consignas:

- Qué servicios / herramientas emplearon a la hora de realizar el desarrollo.
  - Gestión del proyecto.
  - Desarrollo del proyecto:
    - IDEs
    - Sistemas de control de versiones
    - Simulación / Virtualización
- Qué tecnologías utilizaron para el desarrollo del sitio
  - Front end
  - Back end
  - Base de datos
  - Infraestructura
  - Testing

Gestión del proyecto:

Para la gestión del proyecto, comenzamos utilizando los primeros días la plataforma Trello, subiendo cada uno de los requerimientos encontrados en el Backlog. Luego, decidimos migrar el contenido a Jira ya que nos resultó una plataforma mucho más completa para trabajar. Luego de cada lectura del sprint, se subieron manualmente los tickets a Jira y en la validación del sprint se realizó la asignación de las tareas a cada miembro del equipo. Otra de las herramientas que utilizamos para la gestión del proyecto fue Discord, ya que allí nos reunimos para trabajar de forma colectiva o en pares.

Desarrollo del proyecto (IDEs, Sistemas de control de versiones, Simulación/Virtualización):

Tecnologías utilizadas:

Para el sistema de control de versiones, comenzamos usando Github pero luego migramos el trabajo al repositorio de Gitlab otorgado por la institución.

-Frontend: Se utilizó el editor de texto Visual Studio Code. El lenguaje utilizado para crear la aplicación fue Javascript junto con la librería React. A su vez, se emplearon otras librerías tales como: Sweet Alert, Moment, React Calendar y React Gallery Carousel.

-Backend: El IDE utilizado fue IntelliJ, el lenguaje utilizado fue Java junto con el framework Spring Boot. Empleamos Maven para descargar las dependencias necesarias, tales como Swagger, Lombok, JUnit, Spring Boot Security y Json Web Token. Para el testeo y subida de datos se utilizó la herramienta Postman.

-Bases de datos: Las herramientas utilizadas fueron Draw.io para el diseño de las tablas y el sistema de gestión de bases de datos MySQL.

-Infraestructura: AWS

-Testing: Excel, Jest, Postman.

##
## Documentación técnica del proyecto
Esta sección la dejamos a su criterio. Básicamente debería contener toda la información técnica que pueda serle útil a los integrantes del equipo o personas que deban comprender el funcionamiento del sitio desde el lado técnico.

Algunas sugerencias:

- Ambiente de desarrollo
  - Instrucciones de cómo un nuevo integrante debería armarse su ambiente de desarrollo
  - Buenas prácticas / convenciones / acuerdos a la hora de desarrollar
  - Buenas prácticas respecto a los commits, merges y el uso de branches
- Base de datos
  - Estructura y diagramas
  - Scripts / instrucciones para la creación de la base de datos
  - Scripts / set de datos dummy
- Componentes y diagramas de la aplicación
  - Principales partes de la aplicación y cómo se conectan
  - APIs disponibles y su documentación (pueden linkear a un sitio externo)
- Infraestructura
  - Estructura y diagramas
- Testing y calidad
  - Incluir el informe requerido para el cuarto sprint y cualquier otra información referente a cómo buscaron asegurar la calidad del software producido

¿Cómo un nuevo integrante debería armarse el ambiente de desarrollo? El primer paso que debería tomar un nuevo integrante para armarse el ambiente de desarrollo es suministrar su email al resto del equipo para que se lo integre como parte del repositorio de Gitlab. Por otro lado, debería contar con las herramientas ya descritas anteriormente para poder trabajar en cualquiera de las áreas (tener instalado IntelliJ y sus dependencias, VSCode y React, MySQL, etc.). En el caso del backend, es importante destacar que deberá realizar las configuraciones correspondientes en el archivo de application.properties para poder conectarse correctamente a la base de datos. El siguiente paso sería clonar el repositorio completo para poder tener la última versión estable. De esa forma, ya se encontraría habilitado para poder realizar cambios en el código y subirlos al repositorio. Para trabajar utilizamos la estrategia de branching “Gitflow” por lo que le pediríamos que por cada ticket asignado cree una rama en la que trabaje únicamente en esa funcionalidad y que, una vez estable y si no hay conflictos, realice un merge a develop.

Como buenas prácticas a la hora de desarrollar, le pedimos que intente desarrollar un código limpio, evitando repeticiones y reutilizando aquello que ya se hizo. A su vez, es importante una buena división de carpetas para ordenar el trabajo y que ayude a su legibilidad.

En cuanto a buenas prácticas con respecto a los commits, lo ideal es que sean commits descriptivos sobre aquellas funcionalidades que se están agregando. En cuanto al mergeo de las ramas, lo más importante es comunicarlo con el equipo para evitar la pérdida de código.

Bases de datos: 

Modelo del Sprint II: 

![](Aspose.Words.8863d183-b441-4260-be1c-c3324b12d540.004.png)

Modelo del sprint III: 

![](Aspose.Words.8863d183-b441-4260-be1c-c3324b12d540.005.jpeg)

Documentación de la API en Swagger: 


