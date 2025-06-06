
local Vector = Astro.Vector

local function isOnGameplay()

    local screen = SCREENMAN:GetTopScreen()


	local isPlaying = not GAMESTATE:InStepEditor()

	local isEditScreen = screen:GetName() == "ScreenEdit"

    local isValid = isEditScreen and isPlaying


	local isGameplay = screen:GetScreenType():match("Gameplay")

	return isGameplay or isValid

end

local function onGameplay(self)

    if not self:isOnGameplay() then return self end

    self:effectclock('beat'):set_tween_uses_effect_delta(true)

    return self

end


local function configRate()

    local rate = beat4sprite.Config.PreviewRate            return isOnGameplay() and 1 or rate

end

local function BPM_Rate()

    if not isOnGameplay() then return 1 end

    local bpm = GAMESTATE:GetSongBPS() * 60         bpm = math.floor( bpm * 0.01 )

    local rate = 1 + bpm            return math.ceil( rate * 0.5 )

end

local function rate(self) return self:configRate() * self:BPM_Rate() * 2 end

local function tweenRate(self) return self.beat4sprite.Rate * self:rate() end

local function periodRate(self) return self.beat4sprite.Effect.Period * self:rate() end

local function periodSetup(self) self.Effect.Period = periodRate(self) end


local function setupEffect(self)

    local beat4sprite = self.beat4sprite

    local keys = { "Magnitude", "Period", "Offset" }            local Effect = {}
        
    for i,v in ipairs(keys) do Effect[v] = beat4sprite.Effect[v] end

    Effect.Magnitude = Vector( Effect.Magnitude ) -- Do not use the same Vector object.

    self.Effect = Effect            return self

end

local function setEffect( self, effectKey )

    local beat4sprite = self.beat4sprite        local Colors = beat4sprite.Colors


    local effect = self[effectKey]           effect(self)


    local Effect = self.Effect

    local magnitude, period, offset = Effect.Magnitude, Effect.Period, Effect.Offset

    self:setEffectMagnitude(magnitude):effectperiod(period)
    
    offset = offset * period            self:effectoffset(offset)


    if #Colors < 2 then return self end          local color1, color2 = Colors[1], Colors[2]

    self:effectcolor1(color1):effectcolor2(color2)


    return self

end

local function setEffectVector( self, vector )

    self.Effect.Offset = - vector.x + vector.y            return self

end


-- Get the delay time based off a vector.
-- This is used if there's an initial sleep to set a pattern on the planned sequence of tweens.

local function delayFromVector( self, vector ) return vector.x + vector.y end


local function getZoom(self) 
    
    local beat4sprite = self.beat4sprite            return beat4sprite:zoom()

end

local function scaleToScreen(self)

    local scale = SCREEN_HEIGHT / self:GetHeight()          self:zoom(scale)            return self

end

local function fitInScreen(self) return scaleToScreen(self):Center() end


local function queueCommands(self)

    local commands = self.beat4sprite.Commands          self:queueCommands(commands)

end

local function init( self, builder )
    
    local beat4sprite = builder            self.beat4sprite = builder
    

    local filter = beat4sprite.Filter or false              local alpha = beat4sprite.Alpha or 1

    self:SetTextureFiltering(filter)            self:GetParent():diffusealpha(alpha)


    self:setupTimers():onGameplay(self)         setupEffect(self):periodSetup()   queueCommands(self)
    
    return self

end


local merge = { 
    
    configRate = configRate,        BPM_Rate = BPM_Rate,

    init = init,        isOnGameplay = isOnGameplay,        onGameplay = onGameplay,
    
    setupEffect = setupEffect,      setEffect = setEffect,      setEffectVector = setEffectVector,

    getZoom = getZoom,      scaleToScreen = scaleToScreen,          fitInScreen = fitInScreen,
    
    delayFromVector = delayFromVector,          rate = rate,        statesRate = statesRate,        tweenRate = tweenRate,
    
    periodRate = periodRate,        periodSetup = periodSetup

}

Astro.Table.merge( beat4sprite.Actor, merge )