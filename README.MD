# windows server nano + space engineers
this image is a base image without a world, you'll need to derive your own image from this one.

https://docs.docker.com/get-docker/
https://www.spaceengineersgame.com/dedicated-servers/

#### Example dockerfile
```dockerfile
    FROM  docker-space-engineers-nano
    COPY ./world/ /data
    EXPOSE 27016/udp 1973
```

for build command see: https://docs.docker.com/build/building/context/

see [SpaceEngineers-Dedicated.cfg](./world/SpaceEngineers-Dedicated.cfg) line 145. you'll need to change the `<LoadWorld>` tag value to: `C:\data\<your-world>`

when running the container you'll need to bind the ports you chose for your server see: https://docs.docker.com/config/containers/container-networking/