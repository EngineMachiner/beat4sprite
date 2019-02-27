local particle, round_move, sleep_num = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	OffCommand=function(self)
		self:RunCommandsOnChildren(function(child) self.timing = nil end, {})
	end

}

local function Archimedean(self)

	if not self.timing then
		self.timing = 480
	else
		if self.timing < 1 then
			self.timing = 480
			self:queuecommand("GainFocus")
			self:diffusealpha(0)
			return "oops"	
		elseif self.timing > 1 then
			self.timing = self.timing - 7.5
			return { 
						self.timing * math.cos(math.rad(self.timing)), 
						self.timing * math.sin(math.rad(self.timing)) 
					}
		end
	end

end

local function InitProps(self)
	self:diffusealpha(1)
	self:SetAllStateDelays(1/self:GetNumStates())
	self:rotationz(135)
	self:zoom(ScaleVar*1.625)
	self:xy(480 * math.cos(math.rad(480)), 480 * math.sin(math.rad(480)))
	self:finishtweening():queuecommand("Spiral")
end

local lock_bool = true

t[tostring(10+sleep_num)] = LoadActor(particle)..{
	GainFocusCommand=function(self)
		if lock_bool then
			Archimedean(self)
			InitProps(self)
			self:sleep(sleep_num*0.5)
			lock_bool = false
		else
			InitProps(self)
		end
	end,
	SpiralCommand=function(self)

		if Archimedean(self) ~= nil then

			if round_move then
				spin_var = 2
			else
				spin_var = 1
			end

			self:linear(0.5*0.5)
			:rotationz(self:GetRotationZ()-50*0.75*spin_var)
			:zoom(self:GetZoom()-0.075)
			:xy(SCREEN_CENTER_X+Archimedean(self)[1],SCREEN_CENTER_Y+Archimedean(self)[2])
			:queuecommand("Spiral")
			:set_tween_uses_effect_delta(true):effectclock('beat')

		end

	end,
}

collectgarbage();
return t