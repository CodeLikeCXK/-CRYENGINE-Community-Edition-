set(CMAKE_SYSTEM_VERSION 10.0.22000.0)
set(CMAKE_SYSTEM_PROCESSOR ARM64EC)
set(ARM64EC TRUE CACHE BOOL "Build using the ARM64EC ABI" FORCE)
set(CMAKE_CONFIGURATION_TYPES Debug Profile Release)
set(CMAKE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES}" CACHE STRING "Reset the configurations to what we need" FORCE)

set(BUILD_CPU_ARCHITECTURE arm64ec)
set(BUILD_PLATFORM Win64)
set(WINDOWS TRUE)
set(OUTPUT_DIRECTORY_NAME "win_arm64ec")

# Visual Studio generators understand ARM64EC as a platform. Ninja does not,
# so it must rely on the explicit compiler/linker flags below.
if (CMAKE_GENERATOR MATCHES "Visual Studio")
	set(CMAKE_GENERATOR_PLATFORM ARM64EC CACHE STRING "ARM64EC generator platform" FORCE)
else()
	# Ninja has no platform selector; the compiler and linker flags select
	# the ABI in that case.
	set(CMAKE_C_FLAGS_INIT "/arm64EC")
	set(CMAKE_CXX_FLAGS_INIT "/arm64EC")
	set(CMAKE_EXE_LINKER_FLAGS_INIT "/MACHINE:ARM64EC")
	set(CMAKE_SHARED_LINKER_FLAGS_INIT "/MACHINE:ARM64EC")
	set(CMAKE_MODULE_LINKER_FLAGS_INIT "/MACHINE:ARM64EC")
endif()
include("${CMAKE_CURRENT_LIST_DIR}/../../CRYENGINE-MSVC.cmake")

if (NOT CMAKE_GENERATOR MATCHES "Visual Studio")
	# CRYENGINE-MSVC.cmake overwrites the global C++ flags after the initial
	# toolchain flags are evaluated. Re-apply the ABI switch for Ninja.
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /arm64EC")
endif()

add_definitions(-D_WINDOWS -DWIN32 -D_WIN32 -D_WIN64 -D_ARM64EC -D_ARM64EC_ -DARM64EC -D_AMD64_ -DAMD64 -D_ARM64EC_WORKAROUND_)

if (EXISTS "${SDK_DIR}/Microsoft Windows SDK/10")
	set(WINDOWS_SDK "${SDK_DIR}/Microsoft Windows SDK/10")
else()
	get_filename_component(WINDOWS_SDK "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows Kits\\Installed Roots;KitsRoot10]" ABSOLUTE CACHE)
endif()
