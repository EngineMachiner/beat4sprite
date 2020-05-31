
local params = {
	File = "/BGAnimations/Resources/5th/Backgrounds/A.png"
}

local params_2 = {
		File = "/BGAnimations/KB2/1 5x1.png",
		X_num = 5,
		Frame_i = 1,
		Frame_l = 5,
		Commands = { "StairsStates", "SpinX" }
	}

return Def.ActorFrame{
    LoadActor( "../Resources/Scripts/KB.lua", params )..{},
    LoadActor( "../Resources/Scripts/TileTool.lua", params_2 )..{}
}