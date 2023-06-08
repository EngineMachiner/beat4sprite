
local params = ...		local p = params

-- Remove Move command.
local index = p:hasCommand("Move")
if index then table.remove(p.Commands, index) end

local mainAngle = p.mainAngle or 0
local staticAngle = p.StaticAngle or 0

local spinAngle = p.SpinAngle

local a = beat4sprite.ActorFrame() .. {
	OnCommand=function(self) self:Center():rotationz( mainAngle ) end
}

local t = beat4sprite.ActorFrame() .. {
	a, OnCommand=function(self) self:xy( - SCREEN_CENTER_X, - SCREEN_CENTER_Y ) end
}

local function wait(self, w)
	local w = self:GetZoomedWidth()
	return self:getTweenRate() * 1.5 * SCREEN_WIDTH / w 
end

local function template(i)

	return beat4sprite.Actor(p) .. {

		OnCommand=function(self)

			self:rotationz( staticAngle )		self.startingAngle = staticAngle
			self:init()
			
			self:playCommands():queuecommand("Prepare")

		end,

		StatePerSpriteCommand=function(self) self:setstate( self:roundState( i - 1 ) ) end,

		PrepareCommand=function(self)

			local s = math.random( i * 100, ( i + 1 ) * 100 ) * 0.01 * 0.75

			self:diffusealpha(0):sleep( s * self:getTweenRate() ):diffusealpha(1)
			self:queuecommand("Move")

		end,

		-- Sprite Rotation
		RotateCommand=function(self)

			if not spinAngle then return end
			self:rotationz( self.startingAngle ):linear( wait(self) ):rotationz( spinAngle )

		end

	}

end

-- Horizontal

for i = 1, 4 do

	a[#a+1] = beat4sprite.ActorFrame() .. { template( i + 2 ) .. {

		MoveCommand=function(self)

			local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()
			local time = wait(self)			local length = ( w + h ) * 0.5

			local a = 1			if i % 2 == 1 then a = - 1 end

			local parent = self:GetParent()

			parent:x( SCREEN_WIDTH - SCREEN_WIDTH * ( i % 2 ) + length * a )
			parent:y( SCREEN_TOP + h * ( i - 1 ) )
			
			parent:queuecommand("Rotate")
			parent:linear(time):x( parent:GetX() - ( SCREEN_WIDTH + length * 2 ) * a )

			parent:queuecommand("Prepare")

		end

	} }

end

-- Vertical

for i = 1, 8 do

	a[#a+1] = beat4sprite.ActorFrame() .. { template( i ) .. {

		MoveCommand=function(self)

			local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()
			local time = wait(self)				local length = ( w + h ) * 0.5

			local a = 1			if i % 2 == 1 then a = - 1 end

			local parent = self:GetParent()

			parent:y( SCREEN_WIDTH - SCREEN_WIDTH * ( i % 2 ) + length * a - SCREEN_CENTER_Y )
			parent:x( SCREEN_CENTER_X + w * ( i - 4 ) )
			
			parent:queuecommand("Rotate")
			parent:linear(time):y( parent:GetY() - ( SCREEN_WIDTH + length * 2 ) * a )

			parent:queuecommand("Prepare")

		end

	} }

end

return t