local sprite, round_move, sleep_num  = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RemoveAllChildren()
	end

}

local timing = -1

local function Archimedean(self)

	if timing <= 0 then
		timing = 640
		self:queuecommand("GainFocus")
		self:diffusealpha(0)
	elseif timing > 0 then
		timing = timing - 7.5
	end

	return { 
		math.round( timing * 0.875 * math.cos(math.rad(timing)) ), 
		math.round( timing * 0.875 * math.sin(math.rad(timing)) )
	}

end

local lock_2 = true 
local tbl = nil

local function InitProps(self)
	if lock_2 then
		tbl = Archimedean(self)
		self:xy(tbl[1],tbl[2])
		lock_2 = false
	end
	self:diffusealpha(1)
	AnimationDelay(self)
	self:rotationz(135)
	self:zoom(ScaleVar*1.25)
	self:queuecommand("Spiral")
end

local lock_bool = true
local count = sleep_num

t[tostring(10+sleep_num)] = Def.Sprite{
	GainFocusCommand=function(self)

		if type(sprite) == "table" then
			if sleep_num > #sprite then
				count = count - #sprite
			end
			self:Load(sprite[count])
		else
			self:Load(sprite)
		end

		if lock_bool then
			self:set_tween_uses_effect_delta(true):effectclock('beat')
			ToolPreview(self)
			Archimedean(self)
			InitProps(self)
			self:sleep(sleep_num*0.5)
			lock_bool = false
		else
			InitProps(self)
		end

	end,

	SpiralCommand=function(self)

		local spin_var = 1

		if round_move then
			spin_var = 2
		end

		tbl = Archimedean(self)

		self:linear(0.25*0.5)
		:rotationz(self:GetRotationZ()-10*spin_var)
		:zoom(self:GetZoom()-0.015)
		:xy(SCREEN_CENTER_X+tbl[1],SCREEN_CENTER_Y+tbl[2])
		:queuecommand("Spiral")
	end
}

return t