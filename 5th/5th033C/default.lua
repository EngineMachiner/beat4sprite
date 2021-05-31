
local t = Def.ActorFrame{}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/D 5x4.png",
	Y_num = { -2, 1 },
	X_num = 5,
	Frames = { 1, 20, Type = 1 }
}

	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )

local params_2 = {}

	DeepCopy(params, params_2)
	params_2["Fade"] = { 1, 1 }
	params_2["Class"] = "Quad"
	params_2["Color"] = "Rainbow"
	params_2["Commands"] = { "Fade", "Blend" }

	
	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params_2 )

return Def.ActorFrame{ t }