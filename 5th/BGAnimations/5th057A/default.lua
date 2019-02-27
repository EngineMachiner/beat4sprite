local file = "/BGAnimations/Backgrounds/5th/1 (stretch).png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;customtexturerect,0,0,2,2;zoom,2*ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;addx,320*ScaleVar;customtexturerect,0,0,2,2;zoom,2*ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;addx,-320*ScaleVar;customtexturerect,0,0,2,2;zoom,2*ScaleVar)
	};
	LoadActor("../Scripts/ParticlesDown", "Flower.png")..{},
}