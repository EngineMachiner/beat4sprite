
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/63 (stretch).png")..{
		OnCommand=cmd(Center;zoom,3*ScaleVar;customtexturerect,0,0,3,3;
			cropbottom,0.3;croptop,0.3;cropleft,0.2;cropright,0.2)
	},

	LoadActor("../Scripts/InnerEffect/CircleOut","/BGAnimations/Sprites/5th/mushroom.png")..{}

}