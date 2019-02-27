local tool_sprite = "/BGAnimations/Sprites/5th/1 5x4.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Scripts/TileTool", tool_sprite, 2.5/(5*4), ScaleVar, true )..{ OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75); },
	LoadActor("../Scripts/ParticlesDown", "Circle2.png")..{},
}