
local function GetPrefs()
	local mod, prefPath, data = "Config.Load.lua", "Save/OutFoxPrefs.ini", {}
	data.subTheme = LoadModule( mod )( "SoundwavesSubTheme", prefPath )
	data.Colors = BGA_G.LoadThemeModule( "default", "Theme.Colors.lua" )( data.subTheme )
	if data.subTheme == "4" then data.Colors.titleBGPattern = color("#FFD400") end
	return data
end

-- SoundWaves BG
local function BG( f )
	return Def.Quad {
		OnCommand=function(self)
			local colors = GetPrefs().Colors
			self:diffuse( colors.titleBGA )
			self:diffusebottomedge( colors.titleBGB )
			self:Center():diffusealpha(0.5)
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			if f then f(self) end
		end
	}
end

local funcs = {
	BG = BG,
	GetPrefs = GetPrefs
}
BGA_G.SW = {}
for k,v in pairs(funcs) do BGA_G.SW[k] = v end