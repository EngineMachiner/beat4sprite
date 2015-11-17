local t = Def.ActorFrame{
	LoadActor("2.bmp")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(diffuse,color("##ff0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,160;diffuse,color("##ff0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,320;diffuse,color("##ff0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;diffuse,color("##ff0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,160;diffuse,color("##ff0000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,320;diffuse,color("##ff0000"))
	};
	LoadActor("3.png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffusealpha,0.5)
	};
};

return t;