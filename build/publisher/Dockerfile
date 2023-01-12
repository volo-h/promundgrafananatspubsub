# STAGE 1: build
FROM golang:1.19.1-alpine as build

WORKDIR /source

COPY . .

RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o bin/publisher -v services/publisher/main.go

# STAGE 2: run
FROM alpine:3.10 as run

COPY --from=build /source/bin/publisher /publisher

#ENTRYPOINT ["/publisher"]
CMD ["/bin/sh", "-c", "./publisher 2>> /var/lib/publisher/publisher.log"]
