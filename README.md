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
  publisher        --> NATS     <-- subscriber
  (send message)                  (received message)
```
