FROM golang:1.17-alpine


ENV PORT 8080

WORKDIR ./app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download 

COPY . .
RUN go build -o app-server 

EXPOSE $PORT
CMD ["app-server"]
