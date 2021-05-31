
local s = { "Config.Load.lua", "Save/OutFoxPrefs.ini" } -- Soundwaves
local p = "Appearance/Themes/default/"

local ColorTable = LoadThemeModule( "default", "Theme.Colors.lua" )( LoadModule( s[1] )( "SoundwavesSubTheme", s[2] ) )
local currentSubTheme = LoadModule( s[1] )( "SoundwavesSubTheme", s[2] )
local currentBGTheme = LoadModule( s[1] )( "SoundwavesMenuBG", s[2] )

local AnimatedMenu = LoadModule( s[1] )( "FancyUIBG", s[2] )

local LoadMenuBG = Def.ActorFrame{}

if currentBGTheme == "Ocular" then
	LoadMenuBG[#LoadMenuBG+1] = Def.ActorFrame {
		OnCommand=function(self)
			self:diffusealpha(0.11)
		end,
		Def.Sprite {
			InitCommand=function(self)
				self.Sequence = currentBGTheme
				self:Load(p .. "Graphics/_bg inner ring.png")
				self:diffuse( ColorTable["titleBGPattern"] ):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):blend('add')
			end,
			OnCommand=function(self)
				if AnimatedMenu then
					self:spin():effectmagnitude(0,0,-2)
				end
			end
		},
		Def.Sprite {
			InitCommand=function(self)
				self.Sequence = currentBGTheme
				self:Load(p .. "Graphics/_bg outer ring.png")
				self:diffuse( ColorTable["titleBGPattern"] ):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):blend('add')
			end,
			OnCommand=function(self)
				if AnimatedMenu then
					self:spin():effectmagnitude(0,0,3)
				end
			end
		},
	}
end

if currentBGTheme == "Triangles" then
	LoadMenuBG[#LoadMenuBG+1] = Def.ActorFrame {
		Def.Sprite {
		InitCommand=function(self)
			self:Load(p .. "Graphics/_bg tri grid.png")
			self:diffuse( ColorTable["titleBGPattern"] ):diffusealpha(0.03):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			:customtexturerect(0,0,SCREEN_WIDTH*4/512,SCREEN_HEIGHT*4/512)
			:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
		end,
		OnCommand=function(self)
			if AnimatedMenu then
				self:texcoordvelocity(0.025,0)
			end
		end
		},
		Def.Sprite {
			InitCommand=function(self) 
				self:Load(p .. "Graphics/_bg tri corner (res 512x512).png")
				self:vertalign(bottom):horizalign(left):xy(SCREEN_LEFT,SCREEN_BOTTOM) 
			end,
			OnCommand=function(self) self:diffuse( ColorTable["titleBGPattern"] ):blend("add"):diffusealpha(0.14)  end,
		},
		Def.Sprite {
			InitCommand=function(self) 
				self:Load(p .. "Graphics/_bg tri corner (res 512x512).png")
				self:zoomx(-1):zoomy(-1):vertalign(bottom):horizalign(left):xy(SCREEN_RIGHT,SCREEN_TOP) 
			end,
			OnCommand=function(self) self:diffuse( ColorTable["titleBGPattern"] ):blend("add"):diffusealpha(0.14) end,
		},
	}
end

if currentBGTheme == "HexagonPattern" then
	LoadMenuBG[#LoadMenuBG+1] = Def.ActorFrame {
		Def.Sprite {
			InitCommand=function(self)
				self:Load(p .. "Graphics/_bg big grid.png")
				self:diffuse( ColorTable["titleBGPattern"] ):diffusealpha(0.05):blend('add'):zoomto(SCREEN_WIDTH*1.4,SCREEN_HEIGHT*1.4):customtexturerect(0,0,SCREEN_WIDTH*4/512,SCREEN_HEIGHT*4/512):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
			end,
			OnCommand=function(self)
				self:rotationx(-20):fadeleft(0.4):faderight(0.4)
				if AnimatedMenu then
					self:texcoordvelocity(0,0.15)
				end
			end
		},
			
		Def.Sprite {
			InitCommand=function(self)
				self:Load(p .. "Graphics/_bg big grid.png")
				self:diffuse( ColorTable["titleBGPattern"] ):diffusealpha(0.05):blend('add'):zoomto(SCREEN_WIDTH*1.4,SCREEN_HEIGHT*1.4):customtexturerect(0,0,SCREEN_WIDTH*4/512,SCREEN_HEIGHT*4/512):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
			end,
			OnCommand=function(self)
				self:rotationx(-20):fadeleft(0.4):faderight(0.4)
				if AnimatedMenu then
					self:texcoordvelocity(0,0.15)
				end
			end
		}
	}
end

if currentBGTheme == "CheckerBoard" and currentSubTheme ~= "4" then
	LoadMenuBG[#LoadMenuBG+1] = Def.Sprite {
		InitCommand=function(self)
			self:Load(p .. "Graphics/_retro checkerboard.png")
			self:diffuse( ColorTable["titleBGPattern" ] ):zoomto(SCREEN_WIDTH*1.4,SCREEN_HEIGHT+190*1.4):diffusealpha(0.06)
			:customtexturerect(0,0,SCREEN_WIDTH*4/512,SCREEN_HEIGHT*4/512):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
		end,
		OnCommand=function(self)
			if AnimatedMenu then
				self:texcoordvelocity(0,0.15)
			end
			self:rotationx(-20):fadeleft(0.4):faderight(0.4)
		end
	}
end


if AnimatedMenu and currentSubTheme == "4" then 
	LoadMenuBG[#LoadMenuBG+1] = Def.Sprite {
		InitCommand=function(self)
			self:Load(p .. "Graphics/_retro checkerboard.png")
			self:diffuse(color("#FFD400")):zoomto(SCREEN_WIDTH*1.4,SCREEN_HEIGHT+190*1.8):visible(false)
			:customtexturerect(0,0,SCREEN_WIDTH*4/512,SCREEN_HEIGHT*4/512):xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			if currentSubTheme == "4" then
				self:visible(true)
			end
			self:texcoordvelocity(0,0.30):rotationx(-60):fadetop(0.5)
		end
	}
end

return Def.ActorFrame {
	InitCommand=function(self) self:fov(80) end,
	OnCommand=function(self)
		self:playcommand("Init")
		local function Repeat(af)
			af:RunCommandsOnChildren(function(c)

				c:effectclock("beat")
				c:set_tween_uses_effect_delta(true)

				if not tostring(c):match("ActorFrame") then

					if c.Sequence == "Ocular" then
						c:zoom( c:GetZoom() * 0.75 )
						c:addcommand("Sequence",function()

							local z = { c:GetZ(), c:GetRotationZ() }
							local d = BGA_G.GetDelay(c)[2]

							c:stoptweening()

							c:linear( 8*d ):z( z[1] - 500 ):rotationz( z[2] + 90 * math.random( 0, 1000 ) * 0.001 )
							c:linear( 8*d ):z( z[1] ):rotationz( z[2] )

							c:queuecommand("Sequence")
						end)
						c:queuecommand("Sequence")
					end
					
				else
					Repeat(c)
				end

			end)
		end
		Repeat(self)
	end,
	Def.Quad {
		InitCommand=function(self) self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT) end,
		OnCommand=function(self) self:diffuse( ColorTable["titleBGA"] ):diffusebottomedge( ColorTable["titleBGB"] ) end
	},
	LoadMenuBG
}
