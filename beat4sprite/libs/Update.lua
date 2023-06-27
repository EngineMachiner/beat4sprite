
local function onRainbowFlashing(self)

	local p = self.Parameters
	
	if not p.RainbowFlashing then return end

	local clock = self.Clocks.RainbowFlashing
	if not clock then self:diffuse( tapLua.Color.random() ) 	clock = 0 end

	local delta, lim = self:GetEffectDelta(), 0.5

	local atLimit = clock > lim and lim ~= 0

	if atLimit then clock = 0 		self:diffuse( tapLua.Color.random() )
	else clock = clock + delta end

	self.Clocks.RainbowFlashing = clock

end

-- Update the rainbow update function offset.
-- Check Tile.lua fade command.
local function onRainbow( self, offset )

	local p = self.Parameters		local clocks = self.Clocks

	if not p.Rainbow then return self end

	local rate = 300
	if not beat4sprite.GAMESTATE.isOnGameplay() then offset = offset * 2		rate = 4 * 4000 end

	rate = rate * self:GetEffectDelta() * self:getEffectRate()
	
	clocks.Rainbow = clocks.Rainbow - rate
	if not self.FirstOffset then
		
		self.FirstOffset = true
		clocks.Rainbow = clocks.Rainbow + offset * 180 / self:getEffectRate()
	
	end

	return self

end

-- This is my new custom rainbow function.
local function rainbow(self)

	local p = self.Parameters		if not self.Rainbow then return end

	local rate = self:GetEffectDelta() * 100 / self:getEffectRate()

	if not beat4sprite.GAMESTATE.isOnGameplay() then rate = rate * 0.25 end

	self.Clocks.Rainbow = self.Clocks.Rainbow + rate

	local clock = self.Clocks.Rainbow

	--[[
	local color = { 
		1 + math.sin( math.rad( clock + 360 / 3 ) ),
		1 + math.sin( math.rad( clock + 360 * 2 / 3 ) ),
		1 + math.sin( math.rad( clock + 360 ) )
	}
	for i,v in ipairs(color) do color[i] = v * 0.5 end
	self:diffuse( color[1], color[2], color[3], 1 )
	]]

	self.Clocks.Rainbow = clock % 360

	if self:GetTweenTimeLeft() ~= 0 then self = self:GetParent() end

	self:diffuse( HSV( clock, 1, 1 ) )

end

local function common(self) onRainbowFlashing(self)		rainbow(self) end

local function set( self, functions )

	if type(functions) == "function" then functions = { functions } end

	self:GetParent():SetUpdateFunction( function() 
		for k,v in ipairs(functions) do v( self, self.Parameters ) end 
	end )
	
end

beat4sprite.store {

	Update = {
		onRainbow = onRainbow,				onRainbowFlashing = onRainbowFlashing,
		common = common,					set = set
	}

}