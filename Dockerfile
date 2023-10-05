FROM ubuntu:latest

COPY . /app

WORKDIR /app

CMD ["/bin/bash", "proyectoPrimerParcial.sh"]
