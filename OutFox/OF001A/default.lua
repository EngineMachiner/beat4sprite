
local s = { "Config.Load.lua", "Save/OutFoxPrefs.ini" } -- Soundwaves
local p = "Appearance/Themes/default/"

local ColorTable = LoadThemeModule( "default", "Theme.Colors.lua" )( LoadModule( s[1] )( "SoundwavesSubTheme", s[2] ) )

local LoadMenuBG = Def.ActorFrame {
	OnCommand=function(self)
		self:diffusealpha(0.11)
		self:RunCommandsOnChildren(function(c)

			c:effectclock("beat")
			c:set_tween_uses_effect_delta(true)

			c:zoom( c:GetZoom() * 0.75 )

			if not c.CmdsSet then
				c:addcommand("Sequence",function()

					local z = { c:GetZ(), c:GetRotationZ() }
					local d = BGA_G.GetDelay(c)[2]
					local r = math.random( 1000, 3500 ) * 0.001
					local n = math.random(0,1)
					n = n == 0 and -1 or 1
					r = r * n

					c:stoptweening()

					c:linear( 8*d ):z( z[1] - 750 ):rotationz( z[2] + 45 * r )
					c:linear( 8*d ):z( z[1] ):rotationz( z[2] )

					c:queuecommand("Sequence")
				end)
			end
			c.CmdsSet = true

			c:queuecommand("Sequence")

		end)
	end,
	Def.Sprite {
		InitCommand=function(self)
			
			self:Load(p .. "Graphics/_bg inner ring.png")
			self:diffuse( ColorTable["titleBGPattern"] )
			self:Center():blend('add')

			local s = SCREEN_HEIGHT / 720
			self:zoom( self:GetZoom() * s )

			BGA_G.ScreenPreview( self )

		end,
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,-2)
		end
	},
	Def.Sprite {
		InitCommand=function(self)

			self:Load(p .. "Graphics/_bg outer ring.png")
			self:diffuse( ColorTable["titleBGPattern"] )
			self:Center():blend('add')

			local s = SCREEN_HEIGHT / 720
			self:zoom( self:GetZoom() * s )

		end,
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,3)
		end
	}
}

return Def.ActorFrame {
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end,
	InitCommand=function(self) self:fov(80) end,
	OnCommand=function(self)
		self:playcommand("Init")
	end,
	Def.Quad {
		InitCommand=function(self) self:Center():zoomto(SCREEN_WIDTH,SCREEN_HEIGHT) end,
		OnCommand=function(self) self:diffuse( ColorTable["titleBGA"] ):diffusebottomedge( ColorTable["titleBGB"] ) end
	},
	Def.Quad {
		InitCommand=function(self) self:Center():zoomto(SCREEN_WIDTH*0.25,SCREEN_HEIGHT) end,
		OnCommand=function(self)
			self:x( SCREEN_RIGHT )
			self:diffuse( Color.Black )
			self:fadeleft(1)
		end
	},
	LoadMenuBG,
	Def.Sprite {
		InitCommand=function(self)
			
			self:Load(p .. "Graphics/_bg inner ring.png")
			self:diffuse( ColorTable["titleBGPattern"] )
			self:blend('add')
			self:xy(SCREEN_RIGHT, SCREEN_TOP)

			local s = SCREEN_HEIGHT / 720
			self:zoom( self:GetZoom() * s * 3.25 )
			self:diffusealpha(0.05)

			BGA_G.ScreenPreview( self )

		end,
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,-2)
		end
	},
}
