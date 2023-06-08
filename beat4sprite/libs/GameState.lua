
local function isOnGameplay()

	local screen = SCREENMAN:GetTopScreen()
	local type = screen:GetScreenType()

	local onEdit = tostring(screen):match("ScreenEdit") and not GAMESTATE:InStepEditor()
	return type:match("Gameplay") or onEdit

end

local function getDelay(self)

	local p = self.Parameters
	local delay = p and p.States.Rate or 1

	if not beat4sprite.GAMESTATE.isOnGameplay() then return delay * bitEye.Config.Delay end

	local bpm = GAMESTATE:GetSongBPS() * 60
	if bpm > 200 then delay = delay * math.floor( bpm * 0.01 ) * 0.5 end

	return delay

end

local function getEffectRate( self, effectName )

	local p = self.Parameters
	local period = p and p.EffectPeriod or 1

	if not beat4sprite.GAMESTATE.isOnGameplay() and self.Rainbow then 
		period = period * 0.25 
	end

	if not effectName or not p.EffectPeriod then

		return self:getDelay() * period
		
	elseif type(period) == "table" then

		return self:getDelay() * ( period[effectName] or 1 )

	end

end

local function getTweenRate(self)

	local p = self.Parameters
	local tweenRate = p and p.tweenRate or 1

	return self:getDelay() * tweenRate

end

local function getSongBG() return GAMESTATE:GetCurrentSong():GetBackgroundPath() end

beat4sprite.store {

	GAMESTATE = {
		isOnGameplay = isOnGameplay,	getDelay = getDelay,	getSongBG = getSongBG,
		getTweenRate = getTweenRate,	getEffectRate = getEffectRate
	}
	
}