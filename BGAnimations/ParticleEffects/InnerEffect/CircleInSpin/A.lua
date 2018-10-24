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
		self.timing = 1
	else
		if self.timing > 360+90 then
			self.timing = 1
			self:queuecommand("GainFocus")
			return nil			
		else
			self.timing = self.timing + 10*0.5
			local FinalVector = { self.timing * math.cos(math.rad(self.timing)), self.timing * math.sin(math.rad(self.timing)) }
			return FinalVector
		end
	end

end

function InitProps(self)
	Archimedean(self)
	self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y)
	self:SetAllStateDelays(1/self:GetNumStates())
	self:rotationz(135)
	self:zoom(ScaleVar/10)
	self:diffusealpha(0):linear(1):diffusealpha(1)
	self:queuecommand("Spiral")
	--:linear(0.25):diffusealpha(0)
end

local lock_bool = true

t[tostring(10+sleep_num)] = LoadActor(particle)..{
	GainFocusCommand=function(self)
		if lock_bool then
			InitProps(self)
			self:sleep(sleep_num)
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

			self:linear(0.5)
			:rotationz(self:GetRotationZ()+50*0.5*spin_var)
			:zoom(self:GetZoom()+0.05*0.5)
			:xy(SCREEN_CENTER_X+Archimedean(self)[1],SCREEN_CENTER_Y+Archimedean(self)[2])

			:queuecommand("Spiral")
			:set_tween_uses_effect_delta(true):effectclock('beat')

		end

	end,
}

collectgarbage();
return t