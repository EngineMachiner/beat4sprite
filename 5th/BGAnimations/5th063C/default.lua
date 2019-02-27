local ScaleVar = _screen.h/480
local file = "/BGAnimations/Backgrounds/5th/32 (stretch).png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;customtexturerect,0,0,8,8;zoom,8*ScaleVar)
	};
	LoadActor("../Scripts/ParticlesDown", "2 4x1 Letters")..{},
}