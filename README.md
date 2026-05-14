
## MinGW Build of TileDB Embedded for use by R

This repository is a fork of the one by Jeroen Ooms allowing us to proceed
without relying on him.  This repository serves two purposes

- download the release artifact from the GitHub Release page
- re-arrange the files such that the build step of the TileDB-R package can use them

### Details

As of release [2.28.0-rc0][] on 2025-05-06, the mingw64_ucrt64 release binary
have been included as GitHub Release artifact. This greater simplifies the
download process since it is now a stable URL.

[2.28.0-rc0]: https://github.com/TileDB-Inc/TileDB/releases/tag/2.28.0-rc0

To update the files in this repository for a new release of TileDB, run:

```sh
bash update_ucrt_only.sh TAG SHA

# For example
bash update_ucrt_only.sh 2.30.1 6ea48ca
```
