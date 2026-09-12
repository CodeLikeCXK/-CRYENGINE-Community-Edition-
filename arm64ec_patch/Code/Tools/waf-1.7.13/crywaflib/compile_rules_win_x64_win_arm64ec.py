# Copyright 2014-2021 Crytek GmbH / Crytek Group. All rights reserved.
from waflib.Configure import conf

# MSVC uses the ARM64 compiler host tools for ARM64EC. The /arm64EC
# switch selects the ARM64EC ABI while the target SDK libraries remain ARM64.
msvc_target = 'arm64'
msvc_arch = 'amd64'

@conf
def check_win_x64_win_arm64ec_installed(conf):
	"""Check that an MSVC ARM64 toolset is available."""
	env_backup = conf.env
	conf.env = conf.env.derive()
	conf.load_msvc_compiler(msvc_target, msvc_arch)
	ret_value = True if conf.env['MSVC_VERSION'] else False
	conf.env = env_backup
	return ret_value

@conf
def load_win_x64_win_arm64ec_common_settings(conf):
	"""Set compiler and linker settings shared by ARM64EC configurations."""
	v = conf.env
	v['DEFINES'] += [
		'_WIN32', '_WIN64', '_ARM64EC', '_ARM64EC_', 'ARM64EC',
		'_AMD64_', 'AMD64', '_ARM64EC_WORKAROUND_'
	]
	v['CFLAGS'] += ['/arm64EC']
	v['CXXFLAGS'] += ['/arm64EC']
	v['LINKFLAGS'] += ['/MACHINE:ARM64EC']
	v['ARFLAGS'] += ['/MACHINE:ARM64EC']
	conf.load_msvc_compiler(msvc_target, msvc_arch)

@conf
def load_debug_win_x64_win_arm64ec_settings(conf):
	conf.load_win_x64_win_arm64ec_common_settings()
	conf.load_debug_cryengine_settings()
	conf.load_debug_msvc_settings()
	conf.load_debug_windows_settings()

@conf
def load_profile_win_x64_win_arm64ec_settings(conf):
	conf.load_win_x64_win_arm64ec_common_settings()
	conf.load_profile_cryengine_settings()
	conf.load_profile_msvc_settings()
	conf.load_profile_windows_settings()

@conf
def load_performance_win_x64_win_arm64ec_settings(conf):
	conf.load_win_x64_win_arm64ec_common_settings()
	conf.load_performance_cryengine_settings()
	conf.load_performance_msvc_settings()
	conf.load_performance_windows_settings()

@conf
def load_release_win_x64_win_arm64ec_settings(conf):
	conf.load_win_x64_win_arm64ec_common_settings()
	conf.load_release_cryengine_settings()
	conf.load_release_msvc_settings()
	conf.load_release_windows_settings()
