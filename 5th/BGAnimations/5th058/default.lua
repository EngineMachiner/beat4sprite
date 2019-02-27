local file = "/BGAnimations/Backgrounds/5th/1 (stretch).png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/1 (stretch).png")..{
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4)
	};
		LoadActor("../Scripts/Line", "/BGAnimations/Sprites/5th/Leave.png", 0, ScaleVar)..{},
}