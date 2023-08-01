## Introduction
Template that could used to build library for arm cortex-m4/m7 or PC.

## How to build
### Option 1: docker build
- `docker build -t template . && docker run -v "$(pwd):/app" template`

### Option 2: native build
Rust with nightly version is required for this project.
- `make build`
- `make build_micro`

## How to check results
- `make run`

## How to use
Refer to `example/` to check how to call API 
