Cross-platform library for handling system-wide shortcuts in Qt applications.

[![Build Status](https://travis-ci.org/hluk/qxtglobalshortcut.svg?branch=master)](https://travis-ci.org/hluk/qxtglobalshortcut)
[![Windows Build Status](https://ci.appveyor.com/api/projects/status/github/hluk/qxtglobalshortcut?branch=master&svg=true)](https://ci.appveyor.com/project/hluk/qxtglobalshortcut)

[API Reference](https://codedocs.xyz/hluk/qxtglobalshortcut/classQxtGlobalShortcut.html)

This code was originally part of [Qtx](https://bitbucket.org/libqxt/libqxt/wiki/Home) which is no longer maintained.

# Supported Platforms

- Windows
- OS X
- Linux/X11

# Requirements

- Compiler with C++11 support
- Qt 5 or Qt 4
- CMake 3.0.0 and later

# Build

To build the library without installation run:

```bash
cmake .
make
```

To build and install run:

```bash
cmake -DCMAKE_INSTALL_PREFIX=/usr/local .
make install
```

To build static library run:

```bash
cmake -DQXTGLOBALSHORTCUT_STATIC=ON .
make
```

# Use the Library

Directory "example" contains simple CMake project which uses the installed library.

To compile and run the example:

```bash
cd example
cmake .
make
./qxtglobalshortcut_text
```

If `cmake` prints error that it cannot find package for the library you have to specify
it's install path. E.g.

```bash
qxtglobalshortcut_DIR=/usr/local/lib/cmake/qxtglobalshortcut cmake .
```

Alternatively you can add the path to `CMAKE_PREFIX_PATH` environment variable.

