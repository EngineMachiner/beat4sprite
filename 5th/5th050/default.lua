
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/B 4x3.png",
	Frame_i = 7,
	Frame_l = 12,
	Commands = "RandomStates",
	Delay = 1,
	X_num = { -4, 3 },
	Y_num = 1
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}