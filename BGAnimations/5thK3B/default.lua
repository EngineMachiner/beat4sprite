local params = {
	File = "/BGAnimations/Resources/5th/Sprites/CA 4x3.png",
	Frame_i = 3,
	Frame_l = 1,
	X_num = { -4, 3 },
	Y_num = 1,
	Commands = "StairsStates"
}

return Def.ActorFrame{
    LoadActor( "../5thK3A" )..{},
    LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}	
}