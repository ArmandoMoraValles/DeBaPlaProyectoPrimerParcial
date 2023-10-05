# Proyecto del primer parcial

Script de bash para almacenar informacion acerca de las metodologiasd agiles y tradicionales

## Getting Started
usa el siguiente comando para obtener el codigo: 

```
gi clone <urldelrepo>
```

El proyecto inclite un DockerFile por lo que correr el proyeco es muy sencillo a traves de docker

Primeramente hace un build del contenedor de docker
```
docker build -t proyecto_primer_parcial .
```

Nota: Algunas veces puede que necesites usar sudo antes de los comandos de docker eso depende de tu configuracion

### Prerequisites

Solo necesitas tener docker! :D

Usa el siguiente comando para comprobarlo
```
docker -v
```

### Installing
para correr el contenedor usa el siguiente comando: 

```
docker run -it --rm mi-aplicacion-bash /bin/bash -c "./proyectoPrimerParcial.sh -t"
```
recuerda que puedas usar las opciones -a y -t presta atencion a con que flag se ejecuta el script
![image](https://github.com/ArmandoMoraValles/DeBaPlaProyectoPrimerParcial/assets/64659094/3f1622d6-e816-491e-a25d-36c781727361)

## Running the tests

No hay test automatizados

### And coding style tests

No hay test de estilos 

## Deployment

No existe deploy de esta aplicacion

## Built With

* [Docker](http://www.dropwizard.io/1.0.2/docs/](https://www.docker.com/)) - Contenedores
* [bash](https://maven.apache.org/](https://www.gnu.org/software/bash/)) - lenguaje de programacion

## Versioning
Esta es la unia version del proyecto
0.0.1

## Authors

* **Armando Mora Valles** - *Initial work* - [Armando Mora Valles]([https://github.com/PurpleBooth](https://github.com/ArmandoMoraValles))
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
