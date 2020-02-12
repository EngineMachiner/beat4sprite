
local sprt = ...

local ScaleVar = _screen.h/480

local once = true
local angle = 0

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		once = true
		angle = 0
		self:finishtweening():playcommand("Alpha")
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) 
			child:visible(false):finishtweening()
		end)
	end,

}

for i = 0,9 do
	t[#t+1] = LoadActor( sprt )..{
		OnCommand=function(self)
			self:Center()
				:zoom(ScaleVar)
				:SetSize(640,480)
				:effectclock('beat')
				:set_tween_uses_effect_delta(true)
				:queuecommand("Alpha")
			self:faderight(0.1)
			self:fadeleft(0.1)
			self:cropleft((i)*0.1)
			self:cropright((-i+8)*0.1)
				ToolPreview(self)
		end,
		AlphaCommand=function(self)
			if once then
				if i == 9 then 
					once = false
				end
				self:sleep((-i+9)*0.25*0.5)
					:smooth(1)
					:x(SCREEN_CENTER_X - math.round( 30 * math.cos(math.rad(angle))))
					:y(SCREEN_CENTER_Y - math.round( 30 * math.sin(math.rad(angle))))
					:queuecommand("Alpha")
					angle = angle + 7.5 * 1.5
			else
				self:smooth(1)
					:x(SCREEN_CENTER_X - math.round( 30 * math.cos(math.rad(angle))))
					:y(SCREEN_CENTER_Y - math.round( 30 * math.sin(math.rad(angle))))
					:queuecommand("Alpha")
					angle = angle + 7.5 * 1.5
			end
		end
	}
end

return t