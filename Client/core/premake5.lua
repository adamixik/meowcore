project "Client - Core"
	language "C++"
	kind "SharedLib"
	targetname "client"
	targetdir(buildpath("mta"))
	
	filter "system:windows"
		includedirs { "../../vendor/sparsehash/src/windows" }
		linkoptions { "/SAFESEH\:NO" }
		buildoptions { "-Zm130" }
	
	filter {}
		includedirs { 
			".",
			"../sdk",
			"../../vendor/tinygettext",
			"../../vendor/zlib",
			"../../vendor/jpeg-9b",
			"../../vendor/pthreads/include",
			"../../vendor/sparsehash/src/"
		}

	libdirs {
		"../../vendor/detours/lib",
		"../../Bin/Server/",
	}
	

	pchheader "StdInc.h"
	pchsource "StdInc.cpp"
	
	vpaths { 
		["Headers/*"] = "**.h",
		["Sources/*"] = "**.cpp",
		["Resources/*"] = {"**.rc", "../launch/resource/mtaicon.ico"},
		["*"] = "premake5.lua"
	}
	
	files {
		"premake5.lua",
		"../launch/resource/mtaicon.ico",
		"core.rc",
		"**.h",
		"**.cpp"
	}

	links {
		"ws2_32", "d3dx9", "Userenv", "DbgHelp", "xinput", "Imagehlp", "dxguid", "dinput8", 
		"strmiids",	"odbc32", "odbccp32", "shlwapi", "winmm", "gdi32", "Imm32", "Psapi", 
		"pthread", "libpng", "jpeg", "zlib", "tinygettext", "detours", "Client - Game Logic", "Game - San Andreas", "Multiplayer - San Andreas", "Client - GUI",
		"../../vendor/bass/lib/bass",
		"../../vendor/bass/lib/bass_fx",
		"../../vendor/bass/lib/bassmix",
		"../../vendor/bass/lib/tags",
		"CEGUI", "DirectX9GUIRenderer", "Falagard",
		"../../vendor/cegui-0.4.0-custom/lib/freetype2412ST.lib", -- Todo: Select Debug variant, also move freetype to vendor
		"dxerr.lib", "Lua_Client", "pcre", "raknet", "libcurl",
		"Client - Network", "XML", "Normaliz"
	}

	defines {
		"INITGUID",
		"_WIN32_WINNT=0x502",
		"PNG_SETJMP_NOT_SUPPORTED"
	}

	filter "architecture:x64"
		flags { "ExcludeFromBuild" } 
		
	filter "system:not windows"
		flags { "ExcludeFromBuild" } 
