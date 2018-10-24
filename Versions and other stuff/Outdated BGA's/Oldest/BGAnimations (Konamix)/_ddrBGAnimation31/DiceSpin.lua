local t = Def.ActorFrame{
	LoadActor("Dice1")..{
		OnCommand=cmd(diffuse,color("#ff0000");x,32;y,32;rotationz,180;linear,2;rotationz,-180;effectclock,'music';queuecommand,"On")
	};
	LoadActor("Dice2")..{
		OnCommand=cmd(diffuse,color("#ff0000");x,32*(0.675*4);y,32;rotationz,-180;linear,2;rotationz,180;effectclock,'music';queuecommand,"On")
	};
};	
return t;