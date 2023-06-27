
local parameters = ...		local p = parameters

local defaultPosition = { x = 0, y = 0 }
for k,v in pairs( defaultPosition ) do
	local i = math.random( 1, 2 )
	if i == 2 then i = -1 end
	defaultPosition[k] = math.random( 60, 240 ) * 0.01 
end

p.TexturePosition = p.TexturePosition or defaultPosition
local texturePosition = p.TexturePosition

local t = beat4sprite.ActorFrame() --.. {	OnCommand=function(self) self:xy(0,0) end }

-- Texture scrolling direction.
p.Velocity = p.Velocity or { x = 0, y = 0.0625, z = 8 }
local velocity = p.Velocity

-- Literally...
local rects = { 	[3] = - 0.7375,		[4] = 0,
	[5] = 0.273,	[6] = 0.422,		[7] = 0.517,
	[8] = 0.585,	[9] = 0.632,		[10] = 0.674
}

local sides = p.Sides

local Sprite = beat4sprite.Sprite.Square(p) .. {

	OnCommand=function(self)

		p.Target = self:GetParent()

		local h = self:GetHeight() * 0.5

		self:addimagecoords( texturePosition.x, texturePosition.y )
		self:SetCustomPosCoords( 0, h * rects[sides], 0, - h, - h, - h, - h, h )
		self:customtexturerect( 0, 0, h * 0.0012, h * 0.0012 )
		self:texcoordvelocity( velocity.x, velocity.y )

	end

}

t[1] = Sprite		t[2] = Sprite .. { OnCommand=function(self) self:rotationx(180) end }

if not p.RadialScroll then return t end

return loadfile( beat4sprite.Paths.Templates .. "Kaleidoscopes/Texture/Radial.lua" )(p)