#!/bin/bash
set -eux

# Usage: bash update_ucrt_only.sh TAG SHA
#
# where
# tag=X.X.X
# SHA=xxxxxxx

# Setup
TAG="$1"
SHA="$2"
tarball="tiledb-windows-x86_64-mingw64_ucrt64-${TAG}-${SHA}.tar.xz"
url="https://github.com/TileDB-Inc/TileDB/releases/download/${TAG}/"

# Download, extract, and copy
wget "$url/$tarball"
tar xaf "$tarball"
rsync -cav ucrt64/include/tiledb/ include/tiledb/
#rsync -cav ucrt64/lib/libtiledbstatic.a lib/x64-ucrt/libtiledbstatic.a
rsync -cav ucrt64/lib/lib*.a lib/x64-ucrt/

# Cleanup
rm -r "$tarball" ucrt64/ .BUILDINFO .MTREE .PKGINFO
