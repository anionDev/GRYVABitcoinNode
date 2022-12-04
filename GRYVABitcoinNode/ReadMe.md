# GRYVABitcoinNode

## Development-state

![Development-state](https://img.shields.io/badge/development--state-maintenance%20updates%20only-green)

(The underlying [Bitcoin](https://bitcoin.org)-node will be developed actively.)

## Purpose

[GRYVABitcoinNode](https://projects.aniondev.de/PublicProjects/GRYVAImages/GRYVABitcoinNode) is a docker-image for simply running a [Bitcoin](https://bitcoin.org)-node in a docker-container.

The latest-release contains Bitcoin v22.0.

## Usage

### Volumes

Using volumes is not required. There are the following recommended folder for using as volume:

- `/root/.bitcoin`
- `/var/log/tor`

### Example

See the [minimal example `docker-compose.yml`](https://projects.aniondev.de/PublicProjects/GRYVAImages/GRYVABitcoinNode/-/blob/main/GRYVABitcoinNode/Other/Examples/MinimalDockerComposeFile/docker-compose.yml) for an example how to use this image.

## Development

### Branching-system

This repository applies the [GitFlowSimplified](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/BranchingSystem/GitFlowSimplified/GitFlowSimplified.md)-branching-system.

### Repository-structure

This repository applies the [CommonProjectStructure](https://projects.aniondev.de/PublicProjects/Common/ProjectTemplates/-/blob/main/Conventions/RepositoryStructure/CommonProjectStructure/CommonProjectStructure.md)-repository-structure.

## License

See [License.txt](https://projects.aniondev.de/PublicProjects/GRYVAImages/GRYVABitcoinNode/-/raw/main/License.txt) for license-information.
