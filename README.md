# Minimal Rust Docker Container

```bash
curl http://localhost:8080/hello/carlton
```

## Code History

The code in this repository is based on The
[fast rust docker builds](https://youtu.be/xuqolj01D7M)
video.

```bash
cargo new rust-min-docker
cargo add actix_web
curl http://localhost:8080/hello/carlton
docker build -t carltonj2000/rust-min-docker .
docker images # 2G image size
docker run -p 8080:8080 -t carltonj2000/rust-min-docker

# change to multi stage docker build
docker build -t carltonj2000/rust-min-docker .
docker images # 34M image size
docker run -p 8080:8080 -t carltonj2000/rust-min-docker

# multi stage build with cache
docker build -t carltonj2000/rust-min-docker .
docker run -p 8080:8080 -t carltonj2000/rust-min-docker
# make minor change to code
docker build -t carltonj2000/rust-min-docker .
docker run -p 8080:8080 -t carltonj2000/rust-min-docker

# add non-root user
docker build -t carltonj2000/rust-min-docker .
docker run -p 8080:8080 -t carltonj2000/rust-min-docker
```
