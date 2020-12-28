
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/Gradients/E001 8x8.png",
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Frame_l = 1,
	Frame_i = 60,
	Zoom = 4,
	Delay = 4/60,
	Commands = "Mirror"
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}