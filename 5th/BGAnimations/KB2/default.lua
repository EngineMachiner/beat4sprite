local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

t[#t+1] = LoadActor("../Scripts/KaleidoscopeB","/BGAnimations/Backgrounds/5th/Kaleidoscopes/4 (stretch).png")..{}

local count = 0

for i=-1,5+2 do
	t[#t+1] = Def.Sprite{
		OnCommand=function(self)
			self:Load("/BGAnimations/KB2/1 5x1.png")
			self:xy(SCREEN_CENTER_X+self:GetWidth()*ScaleVar*(i-3),SCREEN_CENTER_Y)
				:zoom(ScaleVar)
				:effectclock('beat'):set_tween_uses_effect_delta(true)
				:queuecommand( "Repeat" )
			AnimationDelay(self)
			ToolPreview(self)
			count = count + 1
			if count > self:GetNumStates() - 1 then
				count = 0
			end
			self:setstate(count)
		end,
		RepeatCommand=function(self)
			self:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0)
				:queuecommand( "Repeat" )
				
		end
	}
end

return t