local t = Def.ActorFrame{
	LoadActor("BG.png")..{
		OnCommand=cmd(zoom,2;x,320;y,240)
	};
	LoadActor("BG.png")..{
		OnCommand=cmd(zoom,2;x,960;y,240)
	};
	LoadActor("default2.lua")..{
		OnCommand=cmd(rainbow)
	};
};

return t;