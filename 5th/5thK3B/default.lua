local s = "/BGAnimations/Resources"
local params = {
	File = s .. "/5th/Sprites/CA 4x3.png",
	Frame_i = 3,
	Frame_l = 1,
	X_num = { -4, 3 },
	Y_num = 1,
	Commands = "StairsStates"
}

return Def.ActorFrame{
    loadfile( "/BGAnimations/5thK3A/default.lua" )(),
    loadfile( s .. "/Scripts/TileTool.lua" )( params )
}