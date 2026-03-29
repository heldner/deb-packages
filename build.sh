#!/bin/bash
set -e

PACKAGE="$1"
RELEASE="$2"

if [ -z "$PACKAGE" ]; then
    echo "Usage: $0 <package-name> [release]"
    echo "Available packages:"
    ls -1 packages/
    exit 1
fi

PACKAGE_DIR="packages/$PACKAGE"

if [ ! -d "$PACKAGE_DIR/debian" ]; then
    echo "Error: $PACKAGE_DIR/debian not found"
    exit 1
fi

cd "$PACKAGE_DIR"
RELEASE="${RELEASE}" fakeroot dpkg-buildpackage -b --no-check-builddeps
