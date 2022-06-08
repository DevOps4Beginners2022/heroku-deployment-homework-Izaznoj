FROM golang:1.17-alpine 

WORKDIR /app
ARG PORT=8080

COPY go.mod .
COPY go.sum . 
COPY main.go .

RUN go mod download 

ARG REACT_APP_API_URL
ENV REACT_APP_API_URL $REACT_APP_API_URL

RUN go build  -o app-server 

ENV PORT=$PORT
EXPOSE $PORT
CMD ["./app-server"]
