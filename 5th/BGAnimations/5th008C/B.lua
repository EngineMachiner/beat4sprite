local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
			LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/4 4x1.png", 1/4, ScaleVar, true )..{ 

				OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar x,self:GetChild("template"):GetWidth()/2*ScaleVar ) 

			},
}