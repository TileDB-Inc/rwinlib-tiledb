
## MinGW Build of TileDB Embedded for use by R

This repository is a fork of the one by Jeroen Ooms allowing us to proceed
without relying on him.  This repository serves two purposes

- gather the artifacts from the GitHub Actions 'rtools4' build step of TileDB Embedded
- re-arrange the files such that the build step of the TileDB-R package can use them
  
### Details

The following is from a local script and reflects the Unix desktop use of `~/Downloads`. Adjust
accordingly -- "eventually" we may push the artifacts somewhere where a fixed URL will allow a 
download via `curl` or `wget`.

```sh
#!/bin/bash

## From the rtools4 (and *not* msys2 which is the next compiler set,
## aka what may be used for 'r-devel') build: download the two artifacts
## eg for 2.2.2 the URL is https://github.com/TileDB-Inc/TileDB/runs/1766128541
for f in mingw-w64-i686-tiledb.zip mingw-w64-x86_64-tiledb.zip; do
    mv -v ~/Downloads/${f} .
    unzip ${f}
    rm ${f}
done

tar xaf mingw-w64-i686-tiledb-2.9000-1-any.pkg.tar.xz
rsync -cav mingw32/include/tiledb/ include/tiledb/
rsync -cav mingw32/lib/libtiledbstatic.a lib/i386/libtiledbstatic.a
rm -rf mingw32
rm -v mingw-w64-i686-tiledb-2.9000-1-any.pkg.tar.xz

tar xaf mingw-w64-x86_64-tiledb-2.9000-1-any.pkg.tar.xz
rsync -cav mingw64/include/tiledb/ include/tiledb/
rsync -cav mingw64/lib/libtiledbstatic.a lib/x64/libtiledbstatic.a
rm -rf mingw64
rm -v mingw-w64-x86_64-tiledb-2.9000-1-any.pkg.tar.xz

rm .BUILDINFO .MTREE .PKGINFO
```
  
