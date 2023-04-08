FROM rust:latest

RUN apt-get update && \
    apt-get install -y clang cmake build-essential

WORKDIR /app

COPY . .

RUN cargo build --release

ENTRYPOINT ["/bin/bash", "-c", "./target/release/electrs ${FLAGS}"]
