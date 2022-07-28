FROM rust as builder

COPY .  /app

WORKDIR /app

RUN cargo build --release

# run image

FROM gcr.io/distroless/cc-debian11

COPY --from=builder /app/target/release/rust-min-docker /app/rust-min-docker 

WORKDIR /app

CMD [ "./rust-min-docker" ]