local t = Def.ActorFrame{
	LoadActor("2")..{
		OnCommand=cmd(diffuse,color("#00FFFF"))
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(Center;zoom,5;customtexturerect,0,0,5,5;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075*2.5,0;effectclock,'beat';blend,"BlendMode_Add")
	};
};

return t;