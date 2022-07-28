# analyze dependencies
FROM rust as planner
WORKDIR /app
RUN cargo install cargo-chef
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

# build dependencies
FROM rust as cache
WORKDIR /app
RUN cargo install cargo-chef
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json

# build app
FROM rust as builder
WORKDIR /app
COPY .  .
COPY --from=cache /app/target target
COPY --from=cache /usr/local/cargo /usr/local/cargo
RUN cargo build --release

# run image
FROM gcr.io/distroless/cc-debian11
COPY --from=builder /app/target/release/rust-min-docker /app/rust-min-docker 
WORKDIR /app
CMD [ "./rust-min-docker" ]