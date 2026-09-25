# CRYENGINE ARM64EC Patch

This directory mirrors the official CRYENGINE source tree. Copy its contents
into the root of the target engine checkout to apply the ARM64EC changes.

The patch includes:

- WAF `win_arm64ec` platform support and Visual Studio ARM64EC mapping.
- CMake ARM64EC toolchain and configuration compatibility fixes.
- ARM64EC native platform enumeration (`EPlatform::WindowsARM64EC`) and runtime platform detection (`platform.h`, `CryPlatformDefines.h`).
- ARM64EC scalar math fallback, SIMD intrin support, and 64-bit atomics.
- ProjectManager `win_arm64ec` native game DLL loading and legacy `win_x64` auto-detection fallback.
- Sandbox and module-extension platform handling.
- ResourceCompiler ARM64EC external-project propagation.
- ARM64EC texture compression safety fixes (`squish-ccr` SIMD power-iteration NaN guards).
- ARM64EC-safe Opus, Vorbis, and OpusFile fallback paths.
- Shader binary parser tolerance for forward-compatible shader cache tokens.
- C++ and Schematyc game templates with `win_arm64ec` native DLL selection.

The ResourceCompiler outputs are expected under `Tools/rc` after building. The
patch does not include generated binaries, SDK archives, build directories, or
intermediate files.

