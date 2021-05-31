
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BABC 5x4.png",
	Frame_i = 1,
	Frame_l = 20,
	Commands = "RandomStates",
	X_num = 5,
	FrmDelay = 1,
	Y_num = { -2, 1 }
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )
}