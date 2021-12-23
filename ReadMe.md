# GRYVABitcoinNode

## Purpose

Represents a [Bitcoin-node](https://bitcoin.org/)-server.

## Usage

### Volumes

Using volumes is recommended to preserve data. The available folder for a volume is:

- `/Content/Data`: Folder for all stored data and configuration of the hosted server.

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
docker image build --force-rm --progress plain --build-arg EnvironmentStage=Development --tag gryvabitcoinnode:latest .
```

The image can also be built using the following command which uses no cache:

``` sh
docker image build --no-cache --pull --force-rm --progress plain --build-arg EnvironmentStage=Development --tag gryvabitcoinnode:latest .
```

The `EnvironmentStage`-build-argument must contain one of the following values:

- `Development`
- `QualityManagement`
- `Productive`

### Test image

The built image can be tested using the following command:

``` sh
docker-compose -f docker-compose.example.yml -p GRYVABitcoinNode up --remove-orphans --force-recreate
```

## Version

The latest image contains v0.21.1 of the Bitcoin-node.

## License

See `License.txt` for license-information.
