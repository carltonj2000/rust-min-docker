FROM rust

COPY .  /app

WORKDIR /app

RUN cargo build --release

CMD [ "./target/release/rust-min-docker" ]