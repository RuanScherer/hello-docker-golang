FROM golang:alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go build .

FROM scratch

WORKDIR /src/app

COPY --from=builder /go/src/app/docker-golang /src/app/

ENTRYPOINT [ "./docker-golang" ]