local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/6 (stretch).png")..{
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6)
	}

}

	t[#t+1] = LoadActor( "../Scripts/TileTool","/BGAnimations/Sprites/5th/sparks 1x2.png", 1, 2 )..{
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*-0.5)
			self:diffusealpha(0):sleep(4)
				:diffusealpha(1):sleep(12):queuecommand("On")
				:effectclock("beat")
				:set_tween_uses_effect_delta(true)
		end
	}

	t[#t+1] = LoadActor("/BGAnimations/Backgrounds/5th/47 (stretch).png")..{
		OnCommand=function(self)
			BGA_TCV_OrL(self, 0, 1)
			self:queuecommand("Repeat")
			self:Center()
				:zoom(3*ScaleVar)
				:customtexturerect(0,0,3,3)
				:cropleft(0.25)
				:cropright(0.25)
				:cropbottom(0.25*1.5)
				:croptop(0.25*1.5)
		end,
		RepeatCommand=function(self)
			self:diffusealpha(0):sleep(8):diffusealpha(1):sleep(8)
				:queuecommand("Repeat")
				:effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	}

local count = 0

for i=-1,5+2 do
	t[#t+1] = Def.Sprite{
		OnCommand=function(self)
			self:Load("/BGAnimations/5th046/1 5x1.png")
			self:xy(SCREEN_CENTER_X+self:GetWidth()*ScaleVar*(i-3),SCREEN_CENTER_Y)
				:zoom(ScaleVar):SetAllStateDelays(2*self:GetNumStates()^-1)
				:effectclock('beat'):set_tween_uses_effect_delta(true)
				:queuecommand( "Repeat" )
			ToolPreview(self)
			count = count + 1
			if count > self:GetNumStates() - 1 then
				count = 0
			end
			self:setstate(tbl.count)
		end,
		RepeatCommand=function(self)
			self:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0)
				:queuecommand( "Repeat" )
				
		end
	};
end

return t