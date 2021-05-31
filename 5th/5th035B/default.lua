
local params = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/DAB 4x4.png",
	Frame_i = 5,
	Frame_l = 8,
	Dir = "Right",
	Cleanup = true

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th035A/default.lua" )( params )
	
}