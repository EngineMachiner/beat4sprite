local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/BGExtender", "/BGAnimations/Backgrounds/5th/29 (stretch).png" )..{},
	
	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/2 1x2.png", 1, 2 )..{ 

		OnCommand=function(self)
				self:y( self:GetChild("template"):GetHeight()*ScaleVar/1.75 )
		end

	}
}