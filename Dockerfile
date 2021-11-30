FROM golang:alpine AS build-env
COPY go.mod /work
COPY main.go /work
WORKDIR /work
RUN go build -o hello main.go

FROM busybox
COPY --from=build-env /work/hello /usr/local/bin/hello
ENTRYPOINT /usr/local/bin/hello
