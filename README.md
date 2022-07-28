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
```
