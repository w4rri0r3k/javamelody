# javamelody collector server


example usage:

```
docker run -d -p 8080:8080 \
    -v /data/javamelody:/tmp \
    --restart=always \
    --name javamelody \
    w4rri0r3k/javamelody:latest
```
