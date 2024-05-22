# Developer setup guide
## Getting setup
1. get docker working locally
   * use `docker run hello-world` to verify
1. checkout this repo
1. run the bootstrap script: `./bin/bootstrap`.  This will:
   * invoke docker compose build
   * do the bootstraping for rails/postgres
   * do the bootstrapping for kafka/karafka
## Running
All that should be needed to run the project locally is:
```shell
$ docker compose up
```

Then open (http://localhost:3000/) and (http://localhost:3000/karafka) to explore the application as before.

## Notes:
This process has been tested on Ubuntu 22.04.4 LTS. It was tested by removing the images built locally (eg `docker image rm <>`) and removing the database volume (eg `docker volume rm <>`). 

This project includes adminer in the compose file to facilitate database exploration/testing. It is reachable at (http://localhost/8080).
