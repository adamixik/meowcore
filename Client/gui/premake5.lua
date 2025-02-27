project "Client - GUI"
	language "C++"
	kind "StaticLib"
	targetname "cgui"
	targetdir(buildpath("mta"))
	
	filter "system:windows"
		includedirs { "../../vendor/sparsehash/src/windows" }
	
	filter {}
		includedirs { 
			"../sdk",
			"../../vendor/cegui-0.4.0-custom/include",
			"../../vendor/sparsehash/src/"
		}
	 
	pchheader "StdInc.h"
	pchsource "StdInc.cpp"
	
	links {
		"CEGUI", "DirectX9GUIRenderer", "Falagard",
		"../../vendor/cegui-0.4.0-custom/lib/freetype2412ST.lib", -- Todo: Select Debug variant, also move freetype to vendor
		"d3dx9.lib", 
		"dxerr.lib"
	}
	
	vpaths { 
		["Headers/*"] = "**.h",
		["Sources/*"] = "**.cpp",
		["*"] = "premake5.lua"
	}
	
	files {
		"premake5.lua",
		"*.h",
		"*.cpp"
	}
	
	filter "architecture:x64"
		flags { "ExcludeFromBuild" } 
		
	filter "system:not windows"
		flags { "ExcludeFromBuild" } 