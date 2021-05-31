
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/Gradients/B006 8x8.png",
	X_num = 4,
	Y_num = 1,
	Frame_l = 60,
	Zoom = 4,
	Delay = 8,
	Commands = "Mirror"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params ),
}