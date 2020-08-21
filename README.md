
# mini-li

A Dockerfile to create a tiny image which is just c runtime libs on top of an alpine image. The image is only 6MB large. To add extra components simply add extra lines like this to file.

```console
apk add --no-cache <comp-name>
```
## NOTE
NOTE THIS IS A USEFUL STARTING POINT FOR A BUILDSTREAM IMAGE.
SEE INSTRUCTIONS BELOW. SINCE IT HAS GOLANG DEPENDENCIES IT CAN BE USED AS A GOLANG BUILDSTREAM BASE

eg See https://github.com/KevinGoode/go-buildstream

## Build
```console
docker build -t mini-li:latest .
```
## Run
 
```console
docker container run  -it -d mini-li:latest /bin/sh
```
## Shell
 
```console
docker container exec -it <container-id> /bin/sh
```
## Converting  to a buildstream base 
See
https://samthursfield.wordpress.com/2017/06/19/buildstream-and-host-tools/


```console
docker export --output latest.tar <container-id>
gzip latest.tar
mkdir -p sysroot
tar -x -f latest.tar.gz -C sysroot --exclude=./dev
tar -z -c -f mini-li.tar.gz -C sysroot .
```

