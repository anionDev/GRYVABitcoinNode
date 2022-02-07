# GRYVABitcoinNode

## Purpose

GRYVABitcoinNode is a docker-image for simply running a [Bitcoin-node](https://bitcoin.org/)-server in a docker-container.

## Version

The Bitcoin-node-version in the latest image is v0.21.1.

## Usage

### Volumes

Using volumes is recommended to preserve data. The available folder for a volume is:

- `/Data`: Folder for all stored data and configuration of the hosted server.

### Environment-variables

There are currently no environment-variables available.

### Example

See `docker-compose.example.yml` for an example how to use this image.

## Development

### Branching-system

This repository applies the [GitFlowSimplified](https://projects.aniondev.de/CommonUtilities/Templates/ProjectTemplates/-/blob/main/Templates/Conventions/BranchingSystem/GitFlowSimplified.md)-branching-system.

### Build image

The image can be built using the following command:

``` sh
docker image build --no-cache --pull --force-rm --progress plain --build-arg EnvironmentStage=Development --tag gryvabitcoinnode:latest .
```

The environment-stage can have the one of the following values:

- `Development`
- `QualityManagement`
- `Productive`

### Test image

The built image can be tested using the following command:

``` sh
docker-compose -f docker-compose.example.yml -p GRYVABitcoinNode up --remove-orphans --force-recreate
```
