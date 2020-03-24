# cadvisor

Build of Google's [cadvisor](https://github.com/google/cadvisor) for amd64, arm7, and arm8

## Requirements

- Docker
- Docker buildx

## Building

```
docker buildx build -t rasaro/cadvisor:v0.36.0 -t rasaro/cadvisor:latest --push --platform linux/amd64,linux/arm64,linux/arm .
```
