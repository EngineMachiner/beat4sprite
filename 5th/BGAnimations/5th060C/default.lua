local file = "/BGAnimations/Backgrounds/5th/2 (stretch).png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;addx,320*ScaleVar;zoom,4*ScaleVar;customtexturerect,0,0,4,4)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;addx,-320*ScaleVar;zoom,4*ScaleVar;customtexturerect,0,0,4,4)
	};
	LoadActor("../Scripts/ParticlesDown", "Globe 6x1.png")..{},
}