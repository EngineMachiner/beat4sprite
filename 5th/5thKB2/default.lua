
local params = {
	File = "/BGAnimations/Resources/5th/Backgrounds/A.png"
}

local params_2 = {
		File = "/BGAnimations/Resources/5th/Sprites/X2 5x1.png",
		X_num = 5,
		Frame_i = 1,
		Frame_l = 5,
		Commands = { "StairsStates", "SpinX" }
	}

return Def.ActorFrame{
    loadfile( "/BGAnimations/Resources/Scripts/Kaleidoscopes/Comb.lua" )( params ),
    loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params_2 )
}