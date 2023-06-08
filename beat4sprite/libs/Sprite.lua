
-- Quick creation.

local function Square(parameters)

	local p = parameters
	return beat4sprite.Actor(p) .. {
		InitCommand=function(self) self:Load( p.File, "stretch" ) end,
		OnCommand=function(self) self:init():SetWidth( self:GetHeight() ) end
	}

end

local function colorQuad(color)

	color = color or Color.White
	
	return Def.Quad{ OnCommand=function(self)
		beat4sprite.mainCommand(self)		self:diffuse(color):FullScreen()
	end }
	
end

local function blendQuad(blendName)

	blendName = blendName or 'add'

	return Def.Quad{ OnCommand=function(self)
		beat4sprite.mainCommand(self) 		self:blend( blendName ):FullScreen()
	end }
	
end

local function bgTemplate(parameters)

	local p = parameters
	if not p then p = beat4sprite.GAMESTATE.getSongBG() end
	if type(p) == "string" then p = beat4sprite.create { File = p } end
	if not p.copy then p = beat4sprite.create(p) end

	return p:copy():tweak {
		Commands = p.Commands,		MirrorX = true,		Columns = 1,
		Script = "Tile.lua"
	}

end

-- Update function.

-- Keep track of each sprite animation delay.
-- Optimized to only update on BPM change (not every frame)

local function updateDelay(self)

	local n = self:GetNumStates()		if n <= 1 then return end

	local delays = self.Clocks.States
	if not delays[1] then delays[1] = 1 end

	local current = self:getDelay( self.Parameters ) * delays[1] / n
	if current ~= delays[2] then
		self:SetAllStateDelays(current) 	 delays[2] = current 
	end

end

local function update(self)

	beat4sprite.Update.common(self)
	if not beat4sprite.GAMESTATE.isOnGameplay() then return end
	updateDelay(self)

end

-- Frames logic.

local function getSmallestInSheet(parameters)

	local smallest, p = {}, parameters

	for k,v in pairs( p.Sheet ) do
		local value = smallest.Value
		if not value or v < value then smallest.Value = v		smallest.Key = k end
	end

	return smallest

end

local function sortFrames( parameters, tweaks )

	local p, t = parameters, tweaks

	local a, b = p.States[1], p.States[2]
	
	if b > a then for i=a,b do t[#t+1] = { Frame = i } end
	elseif b < a then for i=a,b,-1 do t[#t+1] = { Frame = i } end
	else t[#t+1] = { Frame = b } end

end

local function roundState( sprite, a )

	a = math.round(a)		-- Sometimes the state "s" can be a float.
	-- So we better round it. Example: RoundTrace.lua

	local n = sprite:GetNumStates()

	while a < 0 do a = a + n end		while a > n - 1 do a = a - n end

	return a

end

local function getStairsState( sprite, states )

	local a = sprite:GetState()
	local i, j = states[1], states[2]
	-- { starting state, ending state }

	a = sprite:roundState( a + i )		a = sprite:roundState( a + j )

	return a

end

local function hasAnimationType( parameters, name )

	local p = parameters		local types = p.States.Types

	for _, v in ipairs(types) do if v == name then return true end end

	return false

end

-- Horizontal wave -> 5th033A
local function xySkip( sprite, states )

	local p, matrix = sprite.Parameters, sprite.posMatrix

	if not p:hasAnimationType("XY-Skip") or not matrix then return states end

	local newStates, sheet = {}, p.Sheet

	local i = matrix.x + matrix.y			i = i * sheet.x

	for j = 1, sheet.x do

		j = sprite:roundState( i + j - 1 ) + 1
		newStates[#newStates+1] = states[j]

	end

	return newStates

end

-- Skips a whole row per column
local function rowSkip( sprite, states )

	local p, matrix = sprite.Parameters, sprite.posMatrix

	if not p:hasAnimationType("RowSkip") or not matrix then return states end

	local newStates, sheet = {}, p.Sheet

	local i = matrix.x + math.ceil( sheet.x * 0.5 ) - 1
	i = i + ( matrix.y + math.ceil( sheet.y * 0.5 ) - 1 ) * sheet.x

	for j = 1, sheet.y do

		j = sprite:roundState( i + ( j - 1 ) * sheet.x ) + 1

		newStates[#newStates+1] = states[j]

	end

	return newStates

end

-- Goes on and backwards
local function pingPong( sprite, states )

	local p = sprite.Parameters

	if not p:hasAnimationType("PingPong") then return states end

	local newStates = {}

	local i = 1
	while i <= sprite:GetNumStates() do newStates[#newStates+1] = states[i]		i = i + 1 end
	while i > 0 do newStates[#newStates+1] = states[i]		i = i - 1 end

	return newStates

end

-- Animation styles.
-- There's these ones and the ones in Tile.lua that require the position matrix.
local function setStyles( sprite, states )

	local p = sprite.Parameters
	
	local styleFunctions = { xySkip = xySkip, rowSkip = rowSkip, pingPong = pingPong }
	
	for k,f in pairs( styleFunctions ) do sprite[k] = f 	states = f( sprite, states ) end

	return states
	
end

local function setStates(self)
	
	local p = self.Parameters		if p.Texture then return self end

	local statesData = {}
	
	p:sortFrames(statesData)		statesData = setStyles( self, statesData )

	statesData = p.CustomStates or statesData 	-- If the users want to do it themselves.

	self:SetStateProperties(statesData)

	self.Clocks.States[2] = nil		-- Reset states rate update function on Update.lua.

	local n = self:GetNumStates()
	local isRandom = tapLua.Table.contains( p.States.Types, "Random" )
	local s = isRandom and math.random( 0, n - 1 ) or 0
	self:setstate(s)

	return self

end

-- Mostly it's just one type between "Random" and "Static".
local function setBasicAnimationTypes(self)

	local p = self.Parameters
	
	local n = self:GetNumStates()		local types = p.States.Types

	if not types then return self end

	for _, type in ipairs(types) do

		-- Set random delays into the update function.
		if type == "Random" and n > 1 then
			self.Clocks.States[1] = math.random( 500, 1500 ) * 0.001
		end

		if type == "Static" then self:animate(false) end

	end

	return self

end

-- When the sprite initializes.

local function scale(self)

	local parameters = self.Parameters
	local h = self:GetTexture():GetSourceHeight()
	
	if parameters.Texture then
		local zoom = h * parameters.numberOf.y		zoom = SCREEN_HEIGHT / zoom
		self:zoom(zoom)		return self
	end

	--[[ Theme scale ]]		local scale = SCREEN_HEIGHT / 480
	--[[ Image scale ]]		scale = scale * ( 480 / h )

	self:zoom( scale * parameters.Zoom )

	return self

end

-- Handles animation stuff while previewing on bitEye.
local function bitEyeAnimation(self)

	if beat4sprite.GAMESTATE.isOnGameplay() then return self end

	local p = self.Parameters
	local states = p.States			local type = states.Types
	local n, rate = self:GetNumStates(), states.Rate
	
	if tapLua.Table.contains( type, "Random Delays" ) then 
		rate = math.random( 500, 1500 ) * 0.001
	end

	if n > 1 then self:SetAllStateDelays( rate * bitEye.Config.Delay / n ) end

	return self

end

local function init(self)

	local p = self.Parameters

	if p.Class ~= "Sprite" then self:scale() return self end

	local file = p.File

	if type(file) == "string" and not self:GetTexture() then self:Load(file) end
	if not self:GetTexture() then self:Load( THEME:GetPathG("","_blank") ) end

	self:scale():setStates():setBasicAnimationTypes()
	self:set_use_effect_clock_for_texcoords(true)
	self:bitEyeAnimation()

	return self

end

local add = {
	sortFrames = sortFrames, hasAnimationType = hasAnimationType,
	getSmallestInSheet = getSmallestInSheet
}

local add2 = {

	colorQuad = colorQuad,			blendQuad = blendQuad,			
	bgTemplate = bgTemplate,		Square = Square,

	setBasicAnimationTypes = setBasicAnimationTypes,
	setStates = setStates,			scale = scale,						init = init,
	roundState = roundState,		getStairsState = getStairsState,
	bitEyeAnimation = bitEyeAnimation,			update = update

}

beat4sprite.template.store(add)

beat4sprite.store { Sprite = add }		beat4sprite.store { Sprite = add2 }