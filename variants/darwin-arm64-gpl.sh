#!/bin/bash

## Source the common GPL settings
. ./variants/defaults-gpl.sh

## Environment variables for ARM64 architecture
export CFLAGS="-arch arm64 -O3"
export CPPFLAGS="-arch arm64"
export LDFLAGS="-arch arm64"

SDKROOT=$(xcrun --show-sdk-path)
export SDKROOT
export HOMEBREW_PREFIX="/usr/local"

## Ensure Homebrew is available and up-to-date
if [ ! $(which brew) ]; then
    echo "Homebrew not found. Please install Homebrew from https://brew.sh"
    exit 1
fi

## Install dependencies via Homebrew
for package in nasm yasm automake pkg-config libtool; do
    if ! brew list $package > /dev/null 2>&1; then
        echo "Installing $package via Homebrew"
        brew install $package || exit 1
    else
        echo "$package is already installed"
    fi
done

## Build FFMpeg
echo "Building FFmpeg for darwin-arm64 with GPL configuration..."
