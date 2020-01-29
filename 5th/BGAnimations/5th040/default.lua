
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RemoveAllChildren()
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 1x2.png", 1, 1)..{}

}