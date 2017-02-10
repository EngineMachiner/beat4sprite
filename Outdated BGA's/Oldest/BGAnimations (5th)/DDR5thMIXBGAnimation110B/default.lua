local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12)
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;;rotationz,90;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;rotationz,180;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;rotationz,270;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;rotationz,260;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;rotationz,450;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;rotationz,540;spin);
	};
	LoadActor("Effect.lua")..{
		OnCommand=cmd(Center;zoom,2;rotationz,630;spin);
	};
};

return t;