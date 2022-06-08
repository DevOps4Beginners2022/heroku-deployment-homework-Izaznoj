FROM golang:1.17-alpine as build

ENV PORT=8080

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change

WORKDIR /app

COPY go.mod go.sum main.go .

RUN go mod download 


RUN go build  -o app-server 

EXPOSE $PORT


CMD ["./app-server"]
