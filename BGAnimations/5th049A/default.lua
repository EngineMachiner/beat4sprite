
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BABC 5x4.png",
	Frame_i = 1,
	Frame_l = 20,
	Commands = "RandomStates",
	Delay = 2/20,
	X_num = 5,
	Y_num = { -2, 1 }
}

return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params )..{}
}