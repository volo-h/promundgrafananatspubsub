#### how to connect into runned container by <CONTAINER ID>?
```sh
  docker exec -it cbbce09e24ec /bin/sh
```

#### how to stop / start container by <CONTAINER ID> 
```sh
  docker stop cbbce09e24ec
  docker start cbbce09e24ec
```

#### common schema
```sh
  publisher        --> NATS        <-- subscriber
  (send message)     (subject)     (received message)
```

### TIPS:
#### error 1 happens when `make docker-up`
```sh
  => => transferring context: 2B                                                                                                                                        0.0s
  => ERROR [internal] load metadata for docker.io/library/golang:1.19.1-alpine                                                                                          1.3s
  => ERROR [internal] load metadata for docker.io/library/alpine:3.10                                                                                                   1.3s
  => [auth] library/alpine:pull token for registry-1.docker.io                                                                                                          0.0s
  => [auth] library/golang:pull token for registry-1.docker.io                                                                                                          0.0s
  ------
  > [internal] load metadata for docker.io/library/golang:1.19.1-alpine:
  ------
  ------
  > [internal] load metadata for docker.io/library/alpine:3.10:
  ------
  failed to solve with frontend dockerfile.v0: failed to create LLB definition: failed to authorize: rpc error: code = Unknown desc = failed to fetch oauth token: unexpected status: 401 Unauthorized
  ERROR: Service 'publisher' failed to build : Build failed
```
#### solution 1
```sh
  export DOCKER_BUILDKIT=0
  export COMPOSE_DOCKER_CLI_BUILD=0
```

#### error 2 happens when `make docker-up`
```sh
  docker-compose -f docker-compose.yaml up --build
  Pulling loki (grafana/loki:2.6.1)...
  ERROR: Head https://registry-1.docker.io/v2/grafana/loki/manifests/2.6.1: unauthorized: incorrect username or password
```

#### solution 2
```sh
  docker logout
  docker login
  use your 'username' not your 'email'
```

#### how investigate volume's?
```sh
  docker volume ls
  docker volume inspect promundgrafananatspubsub_subscriber-data
```

#### drop all volumes / specific volume
```sh
  docker volume prune
  docker system prune
  
  docker volume rm [your_volume]
```

#### show existing network's
```sh
  docker network ls
```

#### NATS
```sh
  nats-server --config node-auth2.conf -V
```
by default stated at port 4222
http://localhost:8222/varz

#### Prometheus Nats Exporter
https://github.com/nats-io/prometheus-nats-exporter.git
```sh
  ./prometheus-nats-exporter -varz "http://localhost:8222"
```
http://localhost:7777/metrics

