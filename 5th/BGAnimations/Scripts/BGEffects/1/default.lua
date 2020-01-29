local sprt = ...

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "/BGAnimations/Scripts/BGExtender", sprt )..{},

	LoadActor( "B.lua", sprt )..{}
	
}