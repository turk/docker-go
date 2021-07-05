FROM golang:1.16.5-buster

RUN apt update -y && apt upgrade -y
RUN apt install bash git -y
RUN apt install fish -y
RUN go get github.com/google/wire/cmd/wire
RUN go get github.com/codegangsta/gin

WORKDIR /var/www/html

COPY go.mod ./
RUN go mod download

COPY . .

# Build the Go app
#RUN go build -o main .

# Expose port 8080 to the outside world
EXPOSE 8001

# Run the executable
CMD ["gin", "-p", "8080"]
