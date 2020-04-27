# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
RUN apk --no-cache add curl && \
    curl -sOL https://github.com/WillAbides/semver-next/releases/download/v0.8.0/semver-next_0.8.0_linux_amd64.tar.gz && \
    tar -xzf semver-next_0.8.0_linux_amd64.tar.gz && \
    rm semver-next_0.8.0_linux_amd64.tar.gz && \
    mv semver-next /usr/local/bin/semver-next

COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

