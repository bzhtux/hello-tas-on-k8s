# builder
FROM golang:alpine AS build-env
LABEL maintainer="Yannick Foeillet <bzhtux@gmail.com>"

RUN apk --no-cache add build-base git bzr mercurial gcc
WORKDIR /go/src/github.com/bzhtux/hello-tas-on-k8s
ADD . /go/src/github.com/bzhtux/hello-tas-on-k8s
RUN go get . && go build -o demo


# final image
FROM alpine

ENV PORT=8080

WORKDIR /app
COPY --from=build-env /go/src/github.com/bzhtux/hello-tas-on-k8s/demo /app/
ENTRYPOINT ./demo
