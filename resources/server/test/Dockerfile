FROM golang:1.8-alpine3.6

RUN echo $GOPATH

WORKDIR $GOPATH/src/github.com/alesr/restapi/

ADD main.go .

ADD server/ server/

RUN go get -u -v ./...

RUN go install -v
