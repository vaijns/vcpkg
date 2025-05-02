vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO vaijns/reflect-on-yourself
	REF "v${VERSION}"
	SHA512 528e85aba5f4729f4286224880cc7ffcb0b05c04623c2c1a2296ea53b3dc3925275775d8763dea89e8f7c0e9967f1d98b22adcc596673c456ed0d05dc2e59034
	HEAD_REF trunk
)

vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS
		-DREFLECT_ON_YOURSELF_CMAKE_DIR=share/reflect-on-yourself
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(
	REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
	REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")
