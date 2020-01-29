local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/BGExtender","/BGAnimations/Backgrounds/5th/Rainbow/CloverRainbowEffect.mpg")..{},

	Def.Quad{
		OnCommand=function(self)
			self:Center()
			self:setsize(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:diffuse(Color.Black)
			self:diffusealpha(0.5-0.25*0.5)
		end
	}

}