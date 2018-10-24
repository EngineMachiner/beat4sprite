local t = Def.ActorFrame{
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(x,320;y,120;zoom,2;effectclock,'music';diffuse,color("#ffe700"))
	};
	LoadActor("2 1x4.png")..{
		OnCommand=cmd(x,320;y,360;zoom,2;effectclock,'music';diffuse,color("#ffe700"))
	};
	LoadActor("3 (stretch).png")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("#FFFFFF80"))
	};
};

return t;