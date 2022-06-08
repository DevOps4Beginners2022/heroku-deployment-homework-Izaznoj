FROM golang:1.17-alpine as build

WORKDIR /app
ENV PORT=8080

COPY go.mod .
COPY go.sum . 
COPY main.go .

RUN go mod download 

RUN go build  -o app-server 


EXPOSE $PORT
CMD ["./app-server"]
