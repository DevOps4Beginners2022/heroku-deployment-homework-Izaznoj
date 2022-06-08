FROM golang:1.17-alpine as build


WORKDIR /app

COPY go.mod .
COPY go.sum . 
COPY main.go .

RUN go mod download 


RUN go build  -o app-server 

CMD ["./app-server"]
