local ScaleVar = _screen.h/480
local file = "/BGAnimations/Backgrounds/5th/8 (stretch).png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("B.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetHeight() --120

			--SCREENMAN:SystemMessage(tostring(child_h))
			self:y(0)
			:linear(SCREEN_HEIGHT/child_h) --exception: not using Tool.lua
			:y(child_h*ScaleVar)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
	LoadActor("B.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetHeight()

			self:y(-child_h*ScaleVar)
			:linear(SCREEN_HEIGHT/child_h) --exception: not using Tool.lua
			:y(0)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
}