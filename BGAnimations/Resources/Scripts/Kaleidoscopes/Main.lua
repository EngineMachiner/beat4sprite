
local params = ...
local p = params

local random = math.random( 10,100 ) * 0.01

local t = BGA_G.Frame() .. {

	Def.Quad{
		OnCommand=function(self)
			self:SetSize(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:Center()
			self:diffuse(Color.Black)
		end
	}
	
}

p.Reversed = p.Reversed and - 1 or 1


local w, h
local ang = 360/6
local ratio = SCREEN_HEIGHT/480

local function Settings( self, j, i )

	self:Center()
	self:SetHeight(320):SetWidth(240)
	if j == 0 then
		w, h = self:GetZoomedWidth(), self:GetZoomedHeight()
	end
	
	self:SetSize(h,h)
	self:rotationz(ang*j)
	self:zoom( self:GetZoom() * ratio )

	if i == 2 then
		self:rotationx(180)
		if j > 0 then
			self:rotationz( self:GetRotationZ() - ang * 2 * j )
		end
	end

end


for j=0,5 do
	for i=1,2 do

		-- Center Kaleidoscope

		t[#t+1] = Def.Sprite{	
			InitCommand=function(self)
				self:Load(p.File, "stretch")
			end,
			OnCommand=function(self)
				self:set_use_effect_clock_for_texcoords(true)
				self:effectclock('beat')
				Settings(self, j, i)
				self:SetCustomPosCoords( 
					-0.5, h*0.75+13,
					-0.5, -h*0.5,
					-h*0.5, -h*0.5,
					-h*0.5, h*0.5
				)
				self:customtexturerect(0,0,w*0.0001*6,h*0.0001*6)
				self:texcoordvelocity( 0, p.Reversed / 8 )
				self:addimagecoords( w * random, 0 )
			end
		}

		-- Cropped Outer Kaleidoscopes (2)

		t[#t+1] = Def.Sprite{	
			InitCommand=function(self)
				self:Load(p.File, "stretch")
			end,
			OnCommand=function(self)
				self:set_use_effect_clock_for_texcoords(true)
				self:effectclock('beat')
				Settings(self, j, i)
				local var = 0.5
				self:SetCustomPosCoords( 
					-h*var, h+12.5*2,
					-h*var, -h*0.5,
					-h*0.5-h*var, -h*0.5,
					-h*0.5-h*var, h * 0.75+12.5
				)
				self:customtexturerect(w*0.0001*6,0,0,h*0.0001*6)
				self:texcoordvelocity( 0, p.Reversed / 8 )
				self:addimagecoords( w * random, 0 )
			end
		}

		t[#t+1] = Def.Sprite{	
			InitCommand=function(self)
				self:Load(p.File, "stretch")
			end,
			OnCommand=function(self)
				self:set_use_effect_clock_for_texcoords(true)
				self:effectclock('beat')
				Settings(self, j, i)
				local var = 0.5*2
				self:SetCustomPosCoords( 
					-h*var, h+12.5*9.38,
					-h*var, -h*0.5,
					-h*0.5-h*var, -h*0.5,
					-h*0.5-h*var, h * 0.75+12.5*8.38
				)
				self:customtexturerect(0,0,w*0.0001*6,h*0.0001*6)
				self:texcoordvelocity( 0, p.Reversed / 8 )
				self:addimagecoords( w * random, 0 )
			end
		}

		t[#t+1] = Def.Sprite{	
			InitCommand=function(self)
				self:Load(p.File, "stretch")
			end,
			OnCommand=function(self)
				self:set_use_effect_clock_for_texcoords(true)
				self:effectclock('beat')
				Settings(self, j, i)
				local var = 0.5*3
				self:SetCustomPosCoords( 
					-h*var, h+12.5*16.75,
					-h*var, -h*0.5,
					-h*0.5-h*var, -h*0.5,
					-h*0.5-h*var, h * 0.75+12.5*16
				)
				self:customtexturerect(w*0.0001*6,0,0,h*0.0001*6)
				self:texcoordvelocity( 0, p.Reversed / 8 )
				self:addimagecoords( w * random, 0 )
			end
		}

	end
end

t = not params.Remove and t

return Def.ActorFrame{ t }