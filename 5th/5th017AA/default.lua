
local count = 0
local tweaks = ...

local t = Def.ActorFrame{}

local params = {

	File = "/BGAnimations/Resources/5th/Backgrounds/CA.png",
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true

} 
 	
 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	BGA_ParamsTweaks( params, tweaks )
	BGA_TileTool( t, params )
	BGA_PostSpawn( t, params, tweaks )


	params = {

	File = "/BGAnimations/Resources/5th/Sprites/CABC 1x4.png",
	Y_num = 2,
	Frame_l = 4,
	Y_coord = -1,
	ScrollSpeed = 2,
	Commands = "Move"

}

 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	BGA_ParamsTweaks( params, tweaks )
	BGA_TileTool( t, params )
	BGA_PostSpawn( t, params, tweaks )


return Def.ActorFrame{ t }