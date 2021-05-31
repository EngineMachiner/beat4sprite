local params = {

	Index = 1,
	File = "BGAnimations/Resources/5th/Sprites/HSV/DA 4x3.png",
	Frame_i = 1,
	Frame_l = 2,
	Delay = 2

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th031B/default.lua" )( params )

}