
local parameters = ...		local p = parameters

local force = 60
local function randomDirection()

	local int = 1000

	local x = math.random( - int, int ) / int
	local y = math.random( - int, int ) / int

	local norm = math.sqrt( (x) ^ 2 + (y) ^ 2 )

	if norm == 0 then return randomDirection() end

	return { x = x * force / norm , y = y * force / norm }

end

local function isOnLimitX(self)
	
	local w = self:GetZoomedWidth()

	local b = self:GetX() + w * 0.5 > SCREEN_WIDTH 
	b = b or self:GetX() - w * 0.5 < 0

	return b

end

local function isOnLimitY(self)

	local h = self:GetZoomedHeight()

	local b = self:GetY() + h * 0.5 > SCREEN_HEIGHT
	b = b or self:GetY() - h * 0.5 < 0

	return b

end

local function move(self)

	if p.Skippy then return end

	local direction = self.direction		local d = self:GetEffectDelta()

	local n = 4
	if isOnLimitX(self) then direction.x = - direction.x		n = n * 2 end

	self:x( self:GetX() + direction.x * d * n )

	n = 4
	if isOnLimitY(self) then direction.y = - direction.y		n = n * 2 end	

	self:y( self:GetY() + direction.y * d * n )

end

local function skippy(self)

	if not p.Skippy then return end

	local w, h = self:GetZoomedWidth() * 0.01,	self:GetZoomedHeight() * 0.01
	local direction = self.direction		local d = self:GetEffectDelta()

	self.time = self.time + d

	if self.time > 0.5 * self:getTweenRate() then
		self:x( self:GetX() + direction.x * w )
		self:y( self:GetY() - direction.y * h )		self.time = 0
	end

	if self:isOnLimitX() then
		direction.x = - direction.x
		self:x( self:GetX() + direction.x * w )
	end

	if self:isOnLimitY() then
		direction.y = - direction.y
		self:y( self:GetY() - direction.y * h )
	end

end

local t = Def.ActorFrame{}

local index = 0

for j=1,3 do		for i=1,4 do

	local b = j < 3 or ( i < 2 and j == 3 )

	local f = beat4sprite.ActorFrame()
	t[#t+1] = beat4sprite.ActorFrame() .. { f }

	if not b then t[#t] = nil end

	f[#f+1] = beat4sprite.Actor(p) .. {

		OnCommand=function(self)

			index = index + 1		self.Index = index

			self.isOnLimitX = isOnLimitX		self.isOnLimitY = isOnLimitY

			self:init()
			
			self.time = 0		self.direction = randomDirection()

			local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()
			local n, time = self:GetNumStates(), self:getTweenRate()

			if n > 1 then
				self:setstate( math.random( 0, ( n - 1 ) ) )
			end

			self:playCommands()

			self:x( w * 0.75 * i )
			self:y( h * ( 0.75 + 0.5 * ( j - i * 0.25 ) ) )

			if p.Run then p.Run(self) end

			self:sleep( self.Index * 0.1 * time ):queuecommand("Move")

		end,

		MoveCommand=function(self)

			local parent = self:GetParent():GetParent()
			local direction = self.direction

			parent:SetUpdateFunction( function() 

				local w, h = self:GetZoomedWidth(),	self:GetZoomedHeight()
				local d = self:GetEffectDelta()

				-- Limit if there is a big frame delta.
				if d < 0.5 then skippy(self) move(self) end
						
			end )

		end,

		StatePerSpriteCommand=function(self) self:setstate( ( i + j ) % self:GetNumStates() ) end

	}

end		end

return t