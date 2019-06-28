local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor( "../Scripts/KaleidoscopeB", "/BGAnimations/Backgrounds/5th/Kaleidoscopes/1 (stretch).png" )..{}
	
}