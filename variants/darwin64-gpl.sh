#!/bin/bash

## Source the common GPL settings
. ./variants/defaults-gpl.sh

## Environment variables for amd64 architecture
export CFLAGS="-arch x86_64 -O3"
export CPPFLAGS="-arch x86_64"
export LDFLAGS="-arch x86_64"

SDKROOT=$(xcrun --show-sdk-path)
export SDKROOT
export HOMEBREW_PREFIX="/usr/local"

## Ensure Homebrew is available and up-to-date
if [ ! $(which brew) ]; then
    echo "Homebrew not found. Please install Homebrew from https://brew.sh"
    exit 1
fi

## Install dependencies via Homebrew
brew install nasm yasm libtool automake autoconf pkg-config

## Build FFMpeg
echo "Building FFmpeg for darwin-x64 with GPL configuration..."
