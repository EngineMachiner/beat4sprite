
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/1 (stretch).png")..{
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;
			cropbottom,0.3;croptop,0.3;cropleft,0.2;cropright,0.2)
	},

	LoadActor("../Scripts/InnerEffect", "/BGAnimations/Sprites/5th/Globe 6x1.png", false, true)..{}

}