# Base image for mini-li
# docker build -t mini-li:latest .
# docker container run  -it -d mini-li:latest /bin/sh
# docker container exec -it <container-id> /bin/sh
FROM alpine
RUN apk add --no-cache libc6-compat


