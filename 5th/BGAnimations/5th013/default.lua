
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/22 (stretch).png")..{
		OnCommand=cmd(Center;x,self:GetX()-self:GetWidth()*ScaleVar;zoom,9*ScaleVar;customtexturerect,0,0,9,9)
	},
	
	LoadActor("../Scripts/BumpEffect","/BGAnimations/Sprites/5th/Star.png")..{},

}