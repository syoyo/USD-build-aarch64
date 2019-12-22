# USD build script for aarch64

Status: W.I.P.

This script build USD(Universal Scene Description) libray for aarch64(and also x64) with self-contained manner.
You can just submodule this repo to build USD.

This build script is to build USD library for your aarch64 application, so building unit tests, some features(e.g. GPU build) and examples(e.g. usdview) are disabled.

## Supported platform

* [ ] AARCH64 cross compile
* [x] AARCH64 native
* [x] x86-64 native

## Setup

```
$ git submodule update --init --recursive
```

Not that boost header files are located `boost` and provided through `bcp` and not managed by git submodule.
(git repo uses boost 1.72. boost 1.71 or less version may fail to build on aarch64(at least boost 1.65.1 will fail due to float128 related issue))

## Environment varialle.

In default, built files are installed to `dist` folder.
If you want to use diffent install location, set envrionemt varialle:

`USD_AARCH64_INSTALL_DIR`

Before running build scripts.

## Procedure

### Build and install TBB

```
$ ./scripts/bootstrap-tbb.sh
$ cd build_tbb
$ make && make install
```

### Build OpenSubdiv(optional)

```
$ ./scripts/bootstrap-osd.sh
$ cd build_osd
$ make && make install
```

### Build PTex(optional)

```
$ ./scripts/bootstrap-ptex.sh
$ cd build_osd
$ make && make install
```

### Build USD

T.B.W.

## Native build

USD-build-aarch64 also privides native build(x64, aarch64).

### all-in-one build

```
$ ./scripts/all-build-native.sh
```

### Minimal build

Imaging, OpenSubdiv and PTex are disabled.

Assume tbb is built.

```
$ ./scripts/bootstrap-native-mindep.sh
$ cd build
$ make
```

## For developer

Boost files are instaled using `bcp` program.
If you want to upgrade boost, install `bcp` then run:
 
```
$ ./scripts/setup-bcp-boost.sh
```

files will be installed to `boost` folder.

## TODO

* [ ] Android build
* [ ] iOS build

## License

The script is licensed under MIT license.
