FROM alpine:3.18
RUN apk update \
&& apk add mariadb \
&& apk add mysql
WORKDIR data
COPY . .
EXPOSE 3000