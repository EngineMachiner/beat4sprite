
local replace = ...

local tweaks = {
	Index = 1,
	Frame_i = 2
}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{
	LoadActor("../5th056B", tweaks)..{}
}