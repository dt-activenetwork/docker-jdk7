# Debian 12 + Oracle JDK 7 Docker Image

This repository builds a Debian 12 based Docker image containing the 64-bit Oracle JDK 7u80. The image is built and published automatically to GitHub Container Registry via GitHub Actions.

## Image details

- **Base image:** `debian:12-slim`
- **JDK version:** Oracle JDK 7u80 (64-bit)
- **Registry:** `ghcr.io/<OWNER>/<REPO>/debian12-oracle-jdk7`
- **Platforms:** `linux/amd64`

> **Note:** Downloading Oracle JDK 7 requires acceptance of Oracle's license terms. The build process uses the legacy download endpoint with the `oraclelicense=accept-securebackup-cookie` header. Ensure that you are permitted to download and use the Oracle JDK in your jurisdiction.

## Building locally

To build the image locally:

```bash
docker build --build-arg JDK_VERSION=7u80 \
             --build-arg JDK_BUILD=b15 \
             --build-arg JDK_HASH=d54c1d3a095b4ff2b6607d096fa80163 \
             -t debian12-oracle-jdk7 .
```

Run the image and verify the JDK installation:

```bash
docker run --rm debian12-oracle-jdk7 java -version
```

## Continuous integration

The GitHub Actions workflow in [`.github/workflows/docker.yml`](.github/workflows/docker.yml) builds and publishes the image on every push to the `main` branch. It produces the `latest` tag as well as a digest-specific tag derived from the Git commit SHA.
