
local s = "/BGAnimations/Resources"
local tweaks = {

	Index = 2,
	Cleanup = true,
	Script = s .. "/Scripts/TileTool.lua",
	File = s .. "/5th/Sprites/BAB 4x4.png",
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
	loadfile( "/BGAnimations/5th060A/default.lua" )( tweaks )
}