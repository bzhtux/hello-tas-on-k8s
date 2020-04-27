# builder
FROM golang:alpine AS build-env
LABEL maintainer="Yannick Foeillet <bzhtux@gmail.com>"

ENV GOPATH=/src

RUN apk --no-cache add build-base git bzr mercurial gcc
RUN mkdir -p /src
ADD . /src
RUN cd /src && go get . && go build -o demo


# final image
FROM alpine

ENV APP_PORT=8080

WORKDIR /app
COPY --from=build-env /src/demo /app/
ENTRYPOINT ./demo
