
local tweaks = {
	Index = 1,
	Commands = "Move",
	Y_coord = 1,
	Y_num = 2
}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
	Dir = "Down",
	Frame_i = 5,
	Frame_l = 6,
	Spin = true,
	Commands = "TwoSprites"

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th047A/default.lua" )( tweaks ),
	loadfile( "/BGAnimations/Resources/Scripts/Particles.lua" )( params )

}