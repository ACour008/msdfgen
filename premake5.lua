project "freetype"
	location "libs/freetype"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name")

	files
	{
		"libs/freetype/include/ft2build.h",
		"libs/freetype/include/freetype/*.h",
		"libs/freetype/include/freetype/config/*.h",
		"libs/freetype/include/freetype/internal/*.h",
		"libs/freetype/src/autofit/autofit.c",
		"libs/freetype/src/base/ftbase.c",
		"libs/freetype/src/base/ftbbox.c",
		"libs/freetype/src/base/ftbdf.c",
		"libs/freetype/src/base/ftbitmap.c",
		"libs/freetype/src/base/ftcid.c",
		"libs/freetype/src/base/ftdebug.c",
		"libs/freetype/src/base/ftfstype.c",
		"libs/freetype/src/base/ftgasp.c",
		"libs/freetype/src/base/ftglyph.c",
		"libs/freetype/src/base/ftgxval.c",
		"libs/freetype/src/base/ftinit.c",
		"libs/freetype/src/base/ftmm.c",
		"libs/freetype/src/base/ftotval.c",
		"libs/freetype/src/base/ftpatent.c",
		"libs/freetype/src/base/ftpfr.c",
		"libs/freetype/src/base/ftstroke.c",
		"libs/freetype/src/base/ftsynth.c",
		"libs/freetype/src/base/ftsystem.c",
		"libs/freetype/src/base/fttype1.c",
		"libs/freetype/src/base/ftwinfnt.c",
		"libs/freetype/src/bdf/bdf.c",
		"libs/freetype/src/bzip2/ftbzip2.c",
		"libs/freetype/src/cache/ftcache.c",
		"libs/freetype/src/cff/cff.c",
		"libs/freetype/src/cid/type1cid.c",
		"libs/freetype/src/gzip/ftgzip.c",
		"libs/freetype/src/lzw/ftlzw.c",
		"libs/freetype/src/pcf/pcf.c",
		"libs/freetype/src/pfr/pfr.c",
		"libs/freetype/src/psaux/psaux.c",
		"libs/freetype/src/pshinter/pshinter.c",
		"libs/freetype/src/psnames/psnames.c",
		"libs/freetype/src/raster/raster.c",
		"libs/freetype/src/sdf/sdf.c",
		"libs/freetype/src/sfnt/sfnt.c",
		"libs/freetype/src/smooth/smooth.c",
		"libs/freetype/src/truetype/truetype.c",
		"libs/freetype/src/type1/type1.c",
		"libs/freetype/src/type42/type42.c",
		"libs/freetype/src/winfonts/winfnt.c"
	}

	includedirs
	{
		"libs/freetype/include"
	}

	defines
	{
		"FT2_BUILD_LIBRARY",
		"_CRT_SECURE_NO_WARNINGS",
		"_CRT_NONSTDC_NO_WARNINGS"
	}

	filter "system:windows"
		systemversion "latests"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		symbols "off"
		
project "msdfgen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"core/**.h",
		"core/**.hpp",
		"core/**.cpp",
		"ext/**.h",
		"ext/**.hpp",
		"ext/**.cpp",
		"lib/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include",
		"freetype/include"
	}

	defines
	{
		"MSDFGEN_USE_CPP11"
	}

	links
	{
		"freetype"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
