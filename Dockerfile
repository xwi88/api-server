# build image
FROM golang:1.14.2-alpine3.11 AS builder

#GO Module ENV
ENV GOPROXY=https://goproxy.cn,https://goproxy.io,https://proxy.golang.org,direct GOPRIVATE=example.com,*.example.com

ENV SRC_PATH=/go/src/github.com/xwi88/api-server
WORKDIR ${SRC_PATH}
COPY . ${SRC_PATH}

#RUN go build -mod=vendor -ldflags '-s -w' -v -o ${SRC_PATH}/dist/api ${SRC_PATH}/cmd/api
RUN go build -ldflags '-s -w' -v -o ${SRC_PATH}/dist/api ${SRC_PATH}/cmd/api


# run image
#Local Run use alpine:3.11.3
FROM alpine:3.11.3
ENV SRC_PATH=/go/src/github.com/xwi88/api-server APP_PATH=/data1/services/app

WORKDIR ${APP_PATH}
COPY --from=builder ${SRC_PATH}/dist .
RUN chmod +x api

#ENTRYPOINT [ "./bin/startup.sh"]
CMD ["./api", "start", "-c=conf/api.yml"]
