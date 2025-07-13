FROM docker.io/multiarch/crossbuild:darwin-x86_64

# Set architecture-specific environment variables
ENV CFLAGS="-arch x86_64 -O3" \
    CPPFLAGS="-arch x86_64" \
    LDFLAGS="-arch x86_64"

# Install dependencies via Homebrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
 && chown -R docker:docker /usr/local \
 && echo 'eval "$(/usr/local/bin/brew shellenv)"' >> /etc/profile \
 && brew install nasm yasm libtool automake autoconf pkg-config

# Maintain consistency with standard Dockerfile structure
COPY images/base/check-wget.sh /build_tools/
COPY images/base/retry-tool.sh /build_tools/

# Default workdir (to be set in child images)
#WORKDIR /build

# macOS-specific build notes:
# - Requires Xcode Command Line Tools
# - SDK paths configured via crossbuild image
# - Homebrew managed in /usr/local for x86_64
