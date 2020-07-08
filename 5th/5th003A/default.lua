
local count = 0
local tweaks = ...

local t = Def.ActorFrame{}

local params = {

	File = "/BGAnimations/Resources/5th/Backgrounds/CA.png",
	X_num = 1,
	BGMirror = true,
	Commands = "Mirror"

} 
 	
 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	BGA_ParamsTweaks( params, tweaks )
	BGA_TileTool( t, params )
	BGA_PostSpawn( t, params, tweaks )


	params = {

	File = "/BGAnimations/Resources/5th/Sprites/C 4x4.png",
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Frame_i = 1,
	Frame_l = 16

}

 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	BGA_ParamsTweaks( params, tweaks )
	BGA_TileTool( t, params )
	BGA_PostSpawn( t, params, tweaks )


return Def.ActorFrame{ t }