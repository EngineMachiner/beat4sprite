local sprt = ...
local ScaleVar = _screen.h/480
local once = true


local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		once = true
		self:finishtweening():playcommand("Alpha")
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) 
			child:visible(false):finishtweening()
		end)
	end,

}

local lenght = 35

for i = 0,9 do
	t[#t+1] = LoadActor( sprt )..{
		OnCommand=function(self)
			self:Center()
				:zoom(ScaleVar)
				:SetSize(640,480)
				:effectclock('beat')
				:set_tween_uses_effect_delta(true)
				:queuecommand("Alpha")
			self:fadebottom(0.1)
			self:fadetop(0.1)
			self:croptop((i)*0.1)
			self:cropbottom((-i+8)*0.1)
		end,
		AlphaCommand=function(self)
			if once then
				if i == 9 then 
					once = false
				end
				self:sleep((-i+9)*0.25*0.5)
					:smooth(1)
					:xy(SCREEN_CENTER_X-lenght,SCREEN_CENTER_Y-lenght)
					:smooth(1)
					:xy(SCREEN_CENTER_X+lenght,SCREEN_CENTER_Y+lenght)
					:queuecommand("Alpha")
			else
				self:smooth(1)
					:xy(SCREEN_CENTER_X-lenght,SCREEN_CENTER_Y-lenght)
					:smooth(1)
					:xy(SCREEN_CENTER_X+lenght,SCREEN_CENTER_Y+lenght)
					:queuecommand("Alpha")
			end
		end
	}
end

return t