
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
	BGA_G.ParTweak( params, replace )
	BGA_G.Tile( t, params )

	params = {

		Index = 2,
		File = "/BGAnimations/Resources/5th/Sprites/CA 4x3.png",
		Frame_i = 9,
		Cleanup = true,
		Dir = "Right",
		Script = "../Resources/Scripts/Particles.lua"

	}

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{ 
	t,
	LoadActor( params.Script, params )
}