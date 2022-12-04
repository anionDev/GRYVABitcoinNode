# GRYVABitcoinServer

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

See [`docker-compose.example.yml`](https://projects.aniondev.de/PublicProjects/GRYVAImages/GRYVABitcoinServer/-/blob/main/GRYVABitcoinServer/Other/Reference/ReferenceContent/Examples/docker-compose.example.yml) for an example how to use this image.

## License

See [License.txt](https://projects.aniondev.de/PublicProjects/GRYVAImages/GRYVABitcoinServer/-/raw/main/License.txt) for license-information.
