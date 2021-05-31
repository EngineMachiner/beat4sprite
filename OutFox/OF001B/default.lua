
local s = { "Config.Load.lua", "Save/OutFoxPrefs.ini" } -- Soundwaves
local p = "Appearance/Themes/default/"

local ColorTable = LoadThemeModule( "default", "Theme.Colors.lua" )( LoadModule( s[1] )( "SoundwavesSubTheme", s[2] ) )

local function FrameStuff(af)
	af:effectclock("beat")
	af:set_tween_uses_effect_delta(true)
	af:diffusealpha(0.11)
	af:Center()
	af:RunCommandsOnChildren(function(c)
		c:effectclock("beat")
		c:set_tween_uses_effect_delta(true)
		c:zoom( c:GetZoom() * 0.625 )
		c:queuecommand("Sequence")
	end)
end

local LoadMenuBG = Def.ActorFrame {
	OnCommand=function(self)
		self:RunCommandsOnChildren(function(af)
			FrameStuff(af)
		end)
	end,
	Def.ActorFrame{
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,-3)
		end,
		Def.Sprite {
			InitCommand=function(self)
				
				self:Load(p .. "Graphics/_bg inner ring.png")
				self:diffuse( ColorTable["titleBGPattern"] )
				self:blend('add')

				local s = SCREEN_HEIGHT / 720
				self:zoom( self:GetZoom() * s )

				BGA_G.ScreenPreview( self )

			end,
			SequenceCommand=function(self)
				local d = BGA_G.GetDelay(self)[2]
				self:rotationx( 0 ):linear(8*d):rotationx( 360 )
				self:queuecommand("Sequence")
			end
		}
	},
	Def.ActorFrame{
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,2)
		end,
		Def.Sprite {
			InitCommand=function(self)

				self:Load(p .. "Graphics/_bg outer ring.png")
				self:diffuse( ColorTable["titleBGPattern"] )
				self:blend('add')

				local s = SCREEN_HEIGHT / 720
				self:zoom( self:GetZoom() * s )

			end,
			SequenceCommand=function(self)
				local d = BGA_G.GetDelay(self)[2]
				local r = self:GetRotationZ()
				self:rotationy( 0 ):linear(8*d):rotationy( 360 )
				self:queuecommand("Sequence")
			end
		}
	}
}

for i=1,3 do
	LoadMenuBG[#LoadMenuBG+1] = Def.ActorFrame{
		OnCommand=function(self)
			local r = i % 2 == 0 and -1 or 1
			self:spin():effectmagnitude(0,0,25*r)
		end,
		Def.Sprite {
			InitCommand=function(self)

				self:Load(p .. "Graphics/_bg inner ring.png")
				self:diffuse( ColorTable["titleBGPattern"] )
				self:blend('add')

				local s = SCREEN_HEIGHT / 720
				self.z = self:GetZoom() * s * 0.125 * i * 0.5
				self:zoom( self.z )
				self:sleep( (i-1) * 0.5 )

			end,
			SequenceCommand=function(self)
				local d = BGA_G.GetDelay(self)[2]
				self:smooth(2*d):zoom( self.z * 1.75 ):diffusealpha(1)
				self:smooth(2*d):zoom( self.z ):diffusealpha(0.375)
				self:queuecommand("Sequence")
			end
		}
	}
end

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
	LoadMenuBG
}
