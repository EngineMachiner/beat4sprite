
local params = ...
local scl = _screen.h/480

local t = BGA_G.Frame()


local w, h
local ang = 360/6
local random = math.random( 10,100 ) * 0.01

local function Settings( self, j )

	self:Center()

	self:SetHeight(320*scl):SetWidth(240*scl)

	if j == 0 then
		w, h = self:GetZoomedWidth(), self:GetZoomedHeight()
	end
	
	self:SetSize(h,h)
	self:rotationz( 90 - ang * 2 * j )
	
end

for x=-2,2 do
	for y=-1,1 do
		for j=0,5 do
			t[#t+1] = Def.Sprite{		
				InitCommand=function(self)
					self:Load(params.File, "stretch")
				end,
				OnCommand=function(self)
					self:set_use_effect_clock_for_texcoords(true)
					self:effectclock('beat')
					Settings( self, j )
					self:x( self:GetX() + h*0.85*x - h*0.25 )
					self:y( self:GetY() + h*0.5*y )
					self:SetCustomPosCoords( 
						0, h*0.75+13*scl,
						0, -h*0.75-13*scl,
						-h*0.5, -h*0.5,
						-h*0.5, h*0.5
					)
					self:rotationx( 180 * ( j % 2 ) )
					self:customtexturerect(0,0,w*0.0001*6,h*0.0001*6)
					self:texcoordvelocity( 0, 1 / 12 )
					self:addimagecoords( w * random, 0 )
					self:zoom(self:GetZoom()*0.5)
				end
			}
		end
	end
	for y=-1,2 do
		for j=0,5 do
			t[#t+1] = Def.Sprite{		
				InitCommand=function(self)
					self:Load(params.File, "stretch")
				end,
				OnCommand=function(self)
					self:set_use_effect_clock_for_texcoords(true)
					self:effectclock('beat')
					Settings( self, j )
					self:x( self:GetX() + h*0.85*x + h*0.425 - h*0.25 )
					self:y( self:GetY() + h*0.5*y - h*0.25 )
					self:SetCustomPosCoords( 
						0, h*0.75+13*scl,
						0, -h*0.75-13*scl,
						-h*0.5, -h*0.5,
						-h*0.5, h*0.5
					)
					self:rotationx( 180 * ( j % 2 ) )
					self:customtexturerect(0,0,w*0.0001*6,h*0.0001*6)
					self:texcoordvelocity( 0, 1 / 12 )
					self:addimagecoords( w * random, 0 )
					self:zoom(self:GetZoom()*0.5)
				end
			}
		end
	end
end

t = not params.Remove and t

return Def.ActorFrame{ t }
