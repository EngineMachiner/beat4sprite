local t = Def.ActorFrame{
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,640)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,-640)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addy,120)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,640;addy,120)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,-640;addy,120)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addy,-120)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,640;addy,-120)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,-640;addy,-120)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addy,240)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,640;addy,240)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,-640;addy,240)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addy,-240)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,640;addy,-240)
	};
	LoadActor("1 1x4.png")..{
		OnCommand=cmd(Center;addx,-640;addy,-240)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,80;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,240;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,400;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,560;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,720;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,880;y,60;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,80;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,240;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,400;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,560;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,720;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,880;y,180;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,80;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,240;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,400;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,560;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,720;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,880;y,300;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,80;y,420;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,240;y,420;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,400;y,420;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,560;y,420;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,720;y,420;spin;effectmagnitude,90,0,0)
	};
	LoadActor("2 4x1.png")..{
		OnCommand=cmd(x,880;y,420;spin;effectmagnitude,90,0,0)
	};
};

return t;