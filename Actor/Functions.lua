
local Vector = Astro.Vector

local function isOnGameplay()

    local screen = SCREENMAN:GetTopScreen()         if not screen then return false end


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

local function BPM_Rate( clamped ) -- If clamped it will sync to 4th beats.

    if clamped == nil then clamped = true end -- It's on by default.

    local bpm = tapLua.currentBPM() * 0.01          if clamped then bpm = math.floor(bpm) end
    
    local rate = ( 1 + bpm ) / 2.75                 rate = math.max( 1, rate )
    
    return clamped and math.ceil(rate) or rate

end

-- statesRate() is used to delay sprite states and sync tweens with the clamping.

local function statesRate( self, clamped ) return configRate() * BPM_Rate(clamped) * 2 end

local function tweenRate( self, clamped ) return self.beat4sprite.Rate * statesRate( self, clamped ) end

local function freeRate(self) return tweenRate( self, false ) end

local function periodRate(self) return self.beat4sprite.Effect.Period * statesRate(self) end

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

local function setEffectOffset( self, vector )

    self.Effect.Offset = - vector.x + vector.y            return self

end


-- Get the delay time based off a vector.
-- This is used if there's an initial sleep to set a pattern on the planned sequence of tweens.

local function delayFromVector( self, vector ) return vector.x + vector.y end


local function scaleToScreen(self)

    local scale = SCREEN_HEIGHT / self:GetHeight()          self:zoom(scale)            return self

end

local function fitInScreen(self) return scaleToScreen(self):Center() end


local function queueCommands(self)

    local commands = self.beat4sprite.Commands          self:queueCommands(commands)

end

local function setAlpha(self)

    local alpha = self.beat4sprite.Alpha            self:diffusealpha(alpha)

    return self

end

local function init( self, builder )
    
    local beat4sprite = builder                     self.beat4sprite = builder
    
    local filter = beat4sprite.Filter               self:SetTextureFiltering(filter)

    self:onGameplay(self)       setupEffect(self):periodSetup()     queueCommands(self)
    
    return self

end


local merge = { 
    
    configRate = configRate,        BPM_Rate = BPM_Rate,            setAlpha = setAlpha,

    init = init,        isOnGameplay = isOnGameplay,        onGameplay = onGameplay,
    
    setupEffect = setupEffect,      setEffect = setEffect,      setEffectOffset = setEffectOffset,

    scaleToScreen = scaleToScreen,          fitInScreen = fitInScreen,              delayFromVector = delayFromVector,
    
    statesRate = statesRate,      tweenRate = tweenRate,        freeRate = freeRate,
    
    periodRate = periodRate,        periodSetup = periodSetup

}

Astro.Table.merge( beat4sprite.Actor, merge )