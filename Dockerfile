FROM golang:alpine AS build-env
RUN mkdir /src
COPY go.mod /src
COPY main.go /src
WORKDIR /src
RUN go build -o hello main.go

FROM busybox
COPY --from=build-env /src/hello /usr/local/bin/hello
ENTRYPOINT /usr/local/bin/hello
