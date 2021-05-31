
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frame_i = 9,
	Z_coord = -1,
	Spin = true,
	Commands = "Shade"

}

return Def.ActorFrame{

	loadfile("/BGAnimations/5th016A/default.lua")(),
	loadfile("/BGAnimations/Resources/Scripts/SpaceEffects/Stairs.lua" )( params )

}