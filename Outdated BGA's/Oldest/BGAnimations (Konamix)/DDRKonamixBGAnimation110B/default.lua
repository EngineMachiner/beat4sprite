local t = Def.ActorFrame{
	LoadActor("Sprite")..{
		OnCommand=cmd()
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,80*2)
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,80*4)
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(addy,80*6)
	};
};

return t;