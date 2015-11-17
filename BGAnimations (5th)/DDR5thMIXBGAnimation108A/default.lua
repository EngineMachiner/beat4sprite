local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12)
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;hibernate,0.25;rotationz,90;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;hibernate,0.5;rotationz,180;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;hibernate,0.75;rotationz,270;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;hibernate,1;rotationz,260;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;hibernate,1.25;rotationz,450;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;hibernate,1.5;rotationz,540;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;hibernate,1.75;rotationz,630;spin);
	};
};

return t;