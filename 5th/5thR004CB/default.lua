
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/Gradients/C002 4x4.png",
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Frame_l = 15,
	Zoom = 2,
	Commands = "Mirror"
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}