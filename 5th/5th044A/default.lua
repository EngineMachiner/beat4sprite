
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

		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 11,
		Frame_l = 15

	}

	count = count + 1
 	params.Index = count
 	params.ID = #t + 1

	t[#t+1] = LoadActor("../Resources/Scripts/5th/WallBumps.lua", params)..{}

	BGA_PostSpawn( t, params, tweaks )

return Def.ActorFrame{ t }
