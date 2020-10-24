
local replace = ...

local params = {

	Index = 1,
	Delay = 1
	
}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th014A",params)..{}

}