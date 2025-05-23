#!/bin/bash

set -x

## From the rtools4 (and *not* msys2 which is the next compiler set,
## aka what may be used for 'r-devel') build: download the two artifacts
## to the ~/Downloads/ directory (i.e. the default location on Ubuntu)
## eg for 2.2.2 the URL is https://github.com/TileDB-Inc/TileDB/runs/1766128541
##
## And now also updated for 'ucrt' builds
##
for f in release-windows-x86_64-mingw64_ucrt64-release-2.28-4764907.zip; do
#for f in mingw-w64-MINGW32-tiledb.zip mingw-w64-MINGW64-tiledb.zip mingw-w64-ucrt64-tiledb.zip; do
    cp ~/Downloads/${f} .
    unzip ${f}
    rm ${f}
done

# tar xaf mingw-w64-i686-tiledb-2.9000-1-any.pkg.tar.xz
# ver=$(strings lib/x64/libtiledbstatic.a | awk '/^GCC: \(Built by Jeroen/ {print $8; exit}')
# if [ ${ver} != "8.3.0" ]; then
#     echo "Wrong format. Exiting."
#     exit -1
# fi
# rsync -cav mingw32/include/tiledb/ include/tiledb/
# #rsync -cav mingw32/lib/libtiledbstatic.a lib/i386/libtiledbstatic.a
# rsync -cav mingw32/lib/lib*.a lib/i386/
# rm -rf mingw32
# rm -v mingw-w64-i686-tiledb-2.9000-1-any.pkg.tar.xz


# tar xaf mingw-w64-x86_64-tiledb-2.9000-1-any.pkg.tar.xz
# rsync -cav mingw64/include/tiledb/ include/tiledb/
# #rsync -cav mingw64/lib/libtiledbstatic.a lib/x64/libtiledbstatic.a
# rsync -cav mingw64/lib/lib*.a lib/x64/
# rm -rf mingw64
# rm -v mingw-w64-x86_64-tiledb-2.9000-1-any.pkg.tar.xz

tar xaf tiledb-windows-x86_64-mingw64_ucrt64-release-2.28-4764907.tar.xz
rsync -cav ucrt64/include/tiledb/ include/tiledb/
#rsync -cav ucrt64/lib/libtiledbstatic.a lib/x64-ucrt/libtiledbstatic.a
rsync -cav ucrt64/lib/lib*.a lib/x64-ucrt/
rm -rf ucrt64
rm -v tiledb-windows-x86_64-mingw64_ucrt64-release-2.28-4764907.tar.xz

rm .BUILDINFO .MTREE .PKGINFO
