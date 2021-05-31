
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/Gradients/J001 4x4.png",
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Frame_i = 15,
	Frame_l = 1,
	Zoom = 2,
	Commands = "Mirror"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )
}