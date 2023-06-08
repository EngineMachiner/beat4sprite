
local SoundWaves = {}        beat4sprite.SoundWaves = SoundWaves

local ThemePath = "Appearance/Themes/default/"      SoundWaves.Path = ThemePath

local function getPreferences()

    local SubTheme = LoadModule("Config.Load.lua")( "SoundwavesSubTheme", "Save/OutFoxPrefs.ini" )
    local Colors = loadfile( ThemePath .. "Modules/Theme.Colors.lua" )(SubTheme)

    return { SubTheme = SubTheme, Colors = Colors }

end
SoundWaves.getPreferences = getPreferences

SoundWaves.quad = function()

    local Preferences = getPreferences()
    local Colors, SubTheme = Preferences.Colors, Preferences.SubTheme

	return beat4sprite.Sprite.colorQuad( Colors(SubTheme).titleBGA ) .. {

		InitCommand=function(self)
			self:diffusebottomedge( Colors(SubTheme).titleBGB ):diffusealpha(0.5)
		end

	}

end