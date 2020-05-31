
local replace = ...

local tweaks = {
	Index = 1,
	Frame_i = 2
}

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{
	LoadActor("../5th056B", tweaks)..{}
}