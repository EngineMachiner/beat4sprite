local ScaleVar = _screen.h/480
local file = "/BGAnimations/Sprites/5th/Star.png"
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("/BGAnimations/Backgrounds/5th/31 (stretch).png")..{
		OnCommand=cmd(Center;zoom,12*ScaleVar;customtexturerect,0,0,12,12;
			cropbottom,0.25;croptop,0.25)
	},

	LoadActor("../Scripts/InnerEffect/CircleInSpin", file )..{}
	
}