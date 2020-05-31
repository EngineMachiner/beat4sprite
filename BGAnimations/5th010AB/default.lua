
local replace = ...

local params = {

	{
		Index = 1,
		X_num = { -3, 5 },
		X_coord = 1,
		Commands = "Move"
	}

}

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th010AA", params)..{}

}