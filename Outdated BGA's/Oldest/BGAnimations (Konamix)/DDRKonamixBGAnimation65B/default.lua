local t = Def.ActorFrame{
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(Center;y,120)
	};
	LoadActor("1 1x2.png")..{
		OnCommand=cmd(Center;y,360)
	};
};

return t;