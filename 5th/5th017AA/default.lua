
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
	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params )


	params = {

	File = "/BGAnimations/Resources/5th/Sprites/CABC 1x4.png",
	Y_num = 2,
	Frame_l = 4,
	Y_coord = -1,
	HurryTweenBy = 2,
	Commands = "Move"

}

 	count = count + 1
 	params.Index = count
	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params )


return Def.ActorFrame{ t }