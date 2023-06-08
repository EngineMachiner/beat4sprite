
local scale = SCREEN_HEIGHT / 480

local params = ...			local p = params

local numberOf = p.numberOf or 18			local alpha = p.Alpha or 1
local direction = p.Move or { x = 1, y = 0 }

tapLua.Vector.toUnit(direction)
local directionAngle = tapLua.Vector.getAngle(direction)

local shade = p.Shade

local files = p.File
if type(files) == "string" then files = { files } end

local staticAngle = p.StaticAngle
if staticAngle == true then staticAngle = 0 end

local spinAngle = p.spinAngle
if spinAngle == true then spinAngle = 720 end

local curve = p.Curve
if curve == true then curve = 45 end

local t = beat4sprite.ActorFrame() .. { OnCommand=function(self) 
	self:fov(120):zbuffer(true)
end }

for i = 1, numberOf do

	local t2 = beat4sprite.ActorFrame() .. { 
		OnCommand=function(self) self:xy( - SCREEN_CENTER_X, - SCREEN_CENTER_Y ) end 
	}
	
	t[#t+1] = beat4sprite.ActorFrame() .. {
		t2, OnCommand=function(self) self:Center():rotationz( directionAngle ) end
	}

	local fileIndex = i
	while fileIndex > #files and #files > 1 do fileIndex = fileIndex - ( #files - 1 ) end

	if #files <= 1 then fileIndex = 1 end

	t2[#t2+1] = beat4sprite.ActorFrame() .. { 

		beat4sprite.Actor(p) .. {

			Texture = files[fileIndex],
			OnCommand=function(self)

				self.Index = i

				self:init()

				local n = self:GetNumStates()
				if n > 1 then n = math.random( 0, n - 1 ) else n = 0 end
				self:setstate(n)

				if staticAngle then self:rotationz( staticAngle ) end
				if p.Color then self:diffuse( p.Color[1] ) end
				if p.Blend then self:blend( p.Blend ) end

				self:diffusealpha(0):sleep( i * self:getTweenRate() * 0.5 )
				self:diffusealpha(1):playCommands()

				self:rotationz( self:GetRotationZ() - directionAngle )
				self.StartingRotation = self:GetRotationZ()

				self:queuecommand("Move")

				if p.Alpha then self:diffusealpha( p.Alpha ) end

				if p.Run then p.Run(self) end

			end,

			MoveCommand=function(self)

				self:playcommand("SetZ")		local parent = self:GetParent()
	
				local w, h = self:GetZoomedWidth(),	self:GetZoomedHeight()
				local tweenRate = self:getTweenRate()			local length = ( w + h ) * 0.5
				local zLength = math.abs( parent:GetZ() ) * 2
				local randomTween = math.random( 40, 80 ) * 0.125
	
				local x = { - length - zLength, 			SCREEN_WIDTH + length + zLength }
				local y = SCREEN_CENTER_X * 0.5
				
				self.tweenTime = tweenRate * randomTween
	
				self:playcommand("Rotate"):playcommand("Curve")
				
				parent:y( math.random( - y, SCREEN_HEIGHT + y ) )
				parent:x( x[1] ):linear( self.tweenTime ):x( x[2] ):queuecommand("Move")
	
			end,
	
			SetZCommand=function(self)
	
				local self = self:GetParent()			local z = math.random( - 500, 0 ) * scale
				local color = {}

				if shade then

					DeepCopy( shade, color )
					for i=1,3 do color[i] = 1 - ( color[i] - z * 0.001 ) end		
					self:diffuse(color)
					
				end
	
				self:z(z)
	
			end,

			RotateCommand=function(self)

				if not spinAngle then return end

				if p.spinAngle == true and math.random(0, 1) == 0 then spinAngle = - spinAngle end

				self:rotationz( self.StartingRotation )
				self:linear( self.tweenTime ):rotationz( self:GetRotationZ() + spinAngle )

			end,

			CurveCommand=function(self)
				
				if not curve then return end

				local p = self:GetParent():GetParent():GetParent()
				p:rotationz(directionAngle):linear( self.tweenTime ):rotationz(curve)

			end,

			StatePerSpriteCommand=function(self) self:setstate( self:roundState( i - 1 ) ) end
		
		} 
	
	}

end

return t