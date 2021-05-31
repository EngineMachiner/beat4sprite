
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/Gradients/F004 8x8.png",
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Frame_l = 60,
	Frame_i = 1,
	Zoom = 4,
	Delay = 2,
	Commands = "Mirror"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )
}