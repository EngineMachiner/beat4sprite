local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		LoadActor("A.lua")..{
		OnCommand=cmd(x,0;y,self:GetChild(""):GetHeight()/2;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;effectclock,"beat";queuecommand,"On")
	};
		LoadActor("../Scripts/InnerEffect/CircleOut", "/BGAnimations/Sprites/5th/Orange 2x1.png")..{},
}