# GRYVABitcoinNode

## Purpose

GRYVABitcoin is a docker-image for simply running a bitcoin-node in a docker-container.

## Usage

### Volumes

Using volumes is recommended. The available volume is:

- `/TODO`

### Environment-variables

There are currently no environment-variables available.

### Example

See `docker-compose.example.yml` for an example how to use it.

## Build

The image can be built using the following command:

``` sh
docker image build --no-cache --pull --force-rm --progress plain --build-arg EnvironmentStage=Development --tag gryvabitcoin:latest .
```

## Test

The built image can be tested using the following command:

``` sh
docker-compose -f docker-compose.example.yml -p gryvabitcoin up
```
