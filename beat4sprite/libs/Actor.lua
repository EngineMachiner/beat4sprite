
local function mainCommand(self)

	if beat4sprite.GAMESTATE.isOnGameplay() then
		self:effectclock('beat'):set_tween_uses_effect_delta(true)
	end

	if self.wasCreated then return end		self.wasCreated = true
	beat4sprite.setFunctions(self)

end

local function ActorFrame(command)

	-- "command" being mostly a command name that repeats.

	return Def.ActorFrame {

		OnCommand=function(self)
			mainCommand(self) 	if command then self:queuecommand(command) end 
		end,
		
		GainFocusCommand=function(self)	self:play() end,
		LoseFocusCommand=function(self) self:stop() end

	}

end

-- Load additional bones.
local function onModel(self)

	local params = self.Parameters

	local bones = params.Bones
	if params.Class ~= "Model" or not self.LoadBones or not bones then return end

	for k,v in pairs(bones) do self:LoadBones( k, v ) end

	-- Maybe temporal for outfox.
	local modelSize = params.Size
	if modelSize then self:setsize( modelSize.x, modelSize.y ) end

end

local updateFunctions = { Sprite = beat4sprite.Sprite.update }
local modelKeys = { "Meshes", "Materials", "Bones" }
local function Actor(params)

	params = params or beat4sprite.create():getInternals()
	
	local class = params.Class

	local preActor = Def[class] {

		InitCommand=function(self)

			self.Parameters = params

			if params.Rainbow then self.Rainbow = true end

			onModel(self)

			-- Update.

			local p = self:GetParent()
			if not p.Clocks then p.Clocks = { Rainbow = 0 } end
			self.Clocks = p.Clocks

			self.onRainbow = beat4sprite.Update.onRainbow
			self.update = beat4sprite.Update.set

			local updateFunction = updateFunctions[class] or beat4sprite.Update.common

			self:update( function() updateFunction(self) end )
			
		end,

		OnCommand=mainCommand

	}

	if class == "Model" then
		for _,v in ipairs(modelKeys) do preActor[v] = params.File end
	end

	return preActor

end

local function playCommands(self)

	local p = self.Parameters		if not p or not p.Commands then return self end
	
	local commands = p.Commands

	for k,v in ipairs(commands) do self:queuecommand(v) end

	return self

end

local sprite = beat4sprite.Sprite
local spriteKeys = { "scale", "bitEyeAnimation", "roundState", "setStates", "getStairsState", "setBasicAnimationTypes" }
local objectFunctions = {

	ActorFrame = function(self)

		self.play = function(self) self:visible(true) 	return self end
		
		self.stop = function(self)

			if tostring(self):match("Sprite") then self:texcoordvelocity(0,0) end

			self:visible(false)			return self

		end

	end,

	Sprite = function(self)

		local isQuickQuad = not self.Clocks		if isQuickQuad then return end

		self.Clocks.States = {}

		local init = self.init
		self.init = function(self)

			local params = self.Parameters		-- Just considering as an alternative.

			init(self)		sprite.init(self)		
			
			return self

		end

		for _, key in ipairs(spriteKeys) do self[key] = sprite[key] end

	end

}

local function init(self)

	local params = self.Parameters

	if not params.Filtering then self:SetTextureFiltering(false) end
	
end

local GAMESTATE = beat4sprite.GAMESTATE
local function setFunctions(self)

	self.init = init
	self.getDelay = GAMESTATE.getDelay
	self.getTweenRate = GAMESTATE.getTweenRate
	self.getEffectRate = GAMESTATE.getEffectRate
	self.playCommands = playCommands

	for k,v in pairs(objectFunctions) do if tostring(self):match(k) then v(self) break end end

end

beat4sprite.store {
	ActorFrame = ActorFrame,	Actor = Actor,		setFunctions = setFunctions,
	mainCommand = mainCommand
}