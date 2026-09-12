# CRYENGINE ARM64EC Patch

This directory mirrors the official CRYENGINE source tree. Copy its contents
into the root of the target engine checkout to apply the ARM64EC changes.

The patch includes:

- WAF `win_arm64ec` platform support and Visual Studio ARM64EC mapping.
- CMake ARM64EC toolchain and configuration compatibility fixes.
- ARM64EC platform detection, scalar math fallback, and 64-bit atomics.
- Sandbox and module-extension platform handling.
- ResourceCompiler ARM64EC external-project propagation.
- ARM64EC-safe Opus, Vorbis, and OpusFile fallback paths.

The ResourceCompiler outputs are expected under `Tools/rc` after building. The
patch does not include generated binaries, SDK archives, build directories, or
intermediate files.
