local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/cutlery 1x2.png", 1, 2, false )..{ 
		OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.325) 
	}

}