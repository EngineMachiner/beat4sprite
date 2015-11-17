return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128);
	};
	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128;addx,256);
	};
	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128;addx,512);
	};
	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128;addx,768);
	};
	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128;addy,256);
	};
	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128;addx,256;addy,256);
	};
	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128;addx,512;addy,256);
	};
	LoadActor("2.png")..{
		OnCommand=cmd(x,128;y,128;addx,768;addy,256);
	};
}
