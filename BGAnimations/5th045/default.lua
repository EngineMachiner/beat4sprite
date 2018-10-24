
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/50 (stretch).png")..{
		OnCommand=cmd(Center;customtexturerect,0,0,4,4;zoom,4*ScaleVar)
	};
		LoadActor("../ParticleEffects/SpiralSpriteZoomIn", "/BGAnimations/Sprites/2 Sun 2x1.png", 1/2)..{ OnCommand=function(self) self:x((SCREEN_WIDTH-640)/2) end },
}