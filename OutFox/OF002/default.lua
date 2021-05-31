
local s = { "Config.Load.lua", "Save/OutFoxPrefs.ini" } -- Soundwaves
local p = "Appearance/Themes/default/"

local ColorTable = LoadThemeModule( "default", "Theme.Colors.lua" )( LoadModule( s[1] )( "SoundwavesSubTheme", s[2] ) )

local group = Def.ActorFrame{
	OnCommand=function(self)
		self:RunCommandsOnChildren(function(c)
			c:effectclock("beat")
			c:set_tween_uses_effect_delta(true)
		end)
	end
}

for i=1,8 do
	for j=1,3 do
		group[#group+1] = Def.Sprite {
			InitCommand=function(self)

				self.Triangle = true

				self:Load(p .. "Graphics/_bg tri corner (res 512x512).png")

				local s = SCREEN_HEIGHT / 720
				self:zoom( 0.5 * s )
				self:fadeleft(0.5)
				local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()

				self:Center()
				
				if i > 4 then
					self:x( self:GetX() + w * ( i - 2.5 - 4 ) )
					self:rotationz(180)
				else
					self:x( self:GetX() + w * ( i - 2.5 ) )
				end
				
				self:y( self:GetY() + h * ( j - 2 ) )

			end,
			OnCommand=function(self)
				self:diffuse( ColorTable["titleBGPattern"] ):blend("add")
				self:diffusealpha(0)
				if i > 4 then
					self:sleep( (i*2+j-3-8) )
				else
					self:sleep( (i*2+j-3) )
				end
				self:queuecommand("Sequence")
			end,
			SequenceCommand=function(self)
			
				local d = BGA_G.GetDelay(self)[2]

				self:stoptweening()
				self:linear( 2*d ):diffusealpha(0):sleep( 2*d )
				self:linear( 2*d ):diffusealpha(0.5)

				self:queuecommand("Sequence")

			end
		}
	end
end

local LoadMenuBG = Def.ActorFrame {
	Def.Sprite {
		InitCommand=function(self)
			self:Load(p .. "Graphics/_bg tri grid.png")
			self:diffuse( ColorTable["titleBGPattern"] ):diffusealpha(0.03):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			:customtexturerect(0,0,SCREEN_WIDTH*4/512,SCREEN_HEIGHT*4/512)
			:Center()
		end,
		OnCommand=function(self)
			local d = BGA_G.GetDelay(self)[2]
			self:set_use_effect_clock_for_texcoords(true)
			self:texcoordvelocity(0.025*d,0)
		end
	},
	group
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
	LoadMenuBG
}
