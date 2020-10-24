
local replace = ...

local params = {

	{
		Index = 1,
		Frame_i = 3,
	},

	{
		Index = 2,
		Frame_i = 10,
		Dir = "Down"
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return LoadActor( "../5th056A", params )..{}