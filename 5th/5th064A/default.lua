
local count = 0

local replace = ...

local t = Def.ActorFrame{}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 6,
	X_num = 5,
	Y_num = { -2, 1 }

} 
 	
 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	BGA_ParamsTweaks( params, replace )
	BGA_TileTool( t, params )

	params = {

		Index = 2,
		File = "/BGAnimations/Resources/5th/Sprites/CA 4x3.png",
		Frame_i = 9,
		ResetParams = true,
		Dir = "Right",
		Script = "../Resources/5th/Scripts/Particles.lua"

	}

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{ 
	t,
	LoadActor( params.Script, params )
}