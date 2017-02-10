local t = Def.ActorFrame{
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,80;y,240;animate,true;setstate,0;effectclock,'music')	
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,240;y,240;animate,true;setstate,2;effectclock,'music')	
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,400;y,240;animate,true;setstate,1;effectclock,'music')	
	};
	LoadActor("1 4x1")..{
		OnCommand=cmd(x,560;y,240;animate,true;setstate,3;effectclock,'music')	
	};
};

return t;