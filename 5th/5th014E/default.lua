
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
	Frame_i = 1,
	Frame_l = 2

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th014A/default.lua" )(),
	loadfile( "/BGAnimations/Resources/Scripts/SpaceEffects/Whirl.lua" )( params )

}