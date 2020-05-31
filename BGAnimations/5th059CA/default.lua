
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/DAB 4x4.png",
	X_num = 4,
	Y_num = 2,
	Frame_i = 5,
	Frame_l = 8,
	X_coord = -1,
	Y_coord = -1,
	Commands = "Move"
}

return Def.ActorFrame{

	LoadActor("../5th059")..{},
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

}