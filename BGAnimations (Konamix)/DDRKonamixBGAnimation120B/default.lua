return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("Sprite")..{
		OnCommand=cmd(x,0;linear,2;addx,320;effectclock,'beat';queuecommand,"On")
	};
	LoadActor("Sprite")..{
		OnCommand=cmd(x,-640;linear,2;addx,320;effectclock,'beat';queuecommand,"On")
	};	
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*2)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*4)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*6)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*8)
	};
}