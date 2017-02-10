local t = Def.ActorFrame{
	LoadActor("2 4x3")..{
		OnCommand=cmd(x,80;y,80;effectclock,'beat')
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(x,80*3;y,80;effectclock,'beat')
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(x,80*5;y,80;effectclock,'beat')
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(x,80*7;y,80;effectclock,'beat')
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(x,80*9;y,80;effectclock,'beat')
	};
	LoadActor("2 4x3")..{
		OnCommand=cmd(x,80*11;y,80;effectclock,'beat')
	};
};

return t;