return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1")..{
		OnCommand=cmd(Center)	
	};
	LoadActor("1")..{
		OnCommand=cmd(Center;addx,640;rotationy,180)	
	};
	LoadActor("1")..{
		OnCommand=cmd(Center;addx,-640;rotationy,180)	
	};
	LoadActor("2")..{
		OnCommand=cmd(x,64;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,192;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,320;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,448;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,576;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,704;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,832;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,960;y,64;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,64;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,192;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,320;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,448;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,576;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,704;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,832;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,960;y,192;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,64;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,192;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,320;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,448;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,576;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,704;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,832;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,960;y,320;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,64;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,192;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,320;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,448;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,576;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,704;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,832;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,960;y,448;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,64;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,192;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,320;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,448;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,576;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,704;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,832;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
	LoadActor("2")..{
		OnCommand=cmd(x,960;y,576;rotationy,90;linear,1;rotationy,-90;linear,1;rotationy,90;queuecommand, "On" ;effectclock,'beat')
	};
};