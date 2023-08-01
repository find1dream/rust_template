# Base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y curl build-essential gcc-arm-none-eabi

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Set the work directory
WORKDIR /app

# Copy the current directory to the container
COPY . /app

# Switch to the work directory
WORKDIR /app

# Install the nightly version of Rust
RUN rustup install nightly

# Add cortex-m4, m7
RUN rustup target add thumbv7em-none-eabihf
RUN rustup component add rust-src

# Build the project in release mode
RUN make test
RUN make build
RUN make build_micro
