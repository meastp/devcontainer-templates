FROM buildpack-deps:${templateOption:imageVariant}-curl

LABEL dev.containers.features="common"

USER root

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install dpkg-dev cppcheck valgrind gcc-13 g++-13 libc6-dev cmake automake make ninja-build rsync zip gdb pkg-config gdb \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Setup ENV vars for vcpkg
ENV VCPKG_ROOT=/usr/local/vcpkg \
    VCPKG_DOWNLOADS=/usr/local/vcpkg-downloads
ENV PATH="${PATH}:${VCPKG_ROOT}"

ARG USERNAME=ubuntu

# Install vcpkg itself: https://github.com/microsoft/vcpkg/blob/master/README.md#quick-start-unix
COPY base-scripts/install-vcpkg.sh /tmp/
RUN chmod +x /tmp/install-vcpkg.sh \
    && ./tmp/install-vcpkg.sh ${USERNAME} \
    && rm -f /tmp/install-vcpkg.sh

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
