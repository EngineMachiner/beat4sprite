
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

group[#group+1] = Def.Sprite {
	InitCommand=function(self)

		self:Load(p .. "Graphics/_bg big grid.png")
		self:diffuse( ColorTable["titleBGPattern"] ):diffusealpha(0.25)
		self:blend('add'):zoomto(SCREEN_WIDTH*1.4*2,SCREEN_HEIGHT*1.4*2)
		self:customtexturerect(0,0,SCREEN_WIDTH*4*2/512,SCREEN_HEIGHT*4*2/512)
		self:Center()

		local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()

	end,
	OnCommand=function(self)
		local d = BGA_G.GetDelay(self)[2]
		local d2 = math.random(0,1)
		d2 = d2 == 0 and -1 or 1
		self:set_use_effect_clock_for_texcoords(true)
		self:fadeleft(0.4):faderight(0.4)
		self:queuecommand("Rot")
	end,
	RotCommand=function(self)
		local d = BGA_G.GetDelay(self)[2]
		local n = { math.random(0,1), math.random(0,1) }
		for i=1,#n do
			n[i] = n[i] == 0 and -1 or 1
		end
		self.scroll = n
		self:queuecommand("ScrollY")
		self:linear(8*d)
		self:rotationx(20*n[1])
		self:rotationy(20*n[2])
		self:linear(8*d):rotationx(0)
		self:queuecommand("ScrollX")
		self:linear(8*d):rotationy(0)
		self:linear(8*d):rotationy(20*n[2])
		self:queuecommand("Rot")
	end,
	ScrollXCommand=function(self)
		local d = BGA_G.GetDelay(self)[2]
		self:texcoordvelocity(0.125*d*self.scroll[1],0)
	end,
	ScrollYCommand=function(self)
		local d = BGA_G.GetDelay(self)[2]
		self:texcoordvelocity(0,0.125*d*self.scroll[2])
	end

}


local LoadMenuBG = Def.ActorFrame {
	Def.Sprite {
		InitCommand=function(self)
			self:Load(p .. "Graphics/_bg big grid.png")
			self:diffuse( ColorTable["titleBGPattern"] ):diffusealpha(0.065)
			self:blend('add'):zoomto(SCREEN_WIDTH*1.4,SCREEN_HEIGHT*1.4)
			self:customtexturerect(0,0,SCREEN_WIDTH*4/512,SCREEN_HEIGHT*4/512)
			self:Center()
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
