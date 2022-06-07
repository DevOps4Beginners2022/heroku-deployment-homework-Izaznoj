FROM golang:1.17-alpine as build


ENV PORT 8080
ENV APP_HOME /app
WORKDIR "$APP_HOME"

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download 

COPY . ./
RUN go build -v -o app-server 

EXPOSE $PORT
CMD ["/app/app-server"]
