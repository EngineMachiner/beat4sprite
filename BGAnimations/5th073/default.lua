
local tweaks = {

	Index = 2,
	ResetParams = true,
	Script = "../Resources/Scripts/TileTool.lua",
	File = "/BGAnimations/Resources/5th/Sprites/BAB 4x4.png",
	Delay = 0.5,
	X_num = { -4, 5 },
	Y_num = 2,
	Frame_i = 1,
	Frame_l = 2,
	X_coord = -1,
	Y_coord = -1,
	Commands = "Move"

}

return Def.ActorFrame{
	LoadActor("../5th060A", tweaks)..{}
}