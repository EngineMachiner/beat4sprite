
local t = Def.ActorFrame{}

	t[#t+1] = LoadActor( "../5th034C" )..{}

local p2, p3 = {}, {}
local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/D 5x4.png",
	Y_num = { -1, -1 },
	X_num = { -2, 1 },
	Spacing = { 1.25, 1.375 },
	Frame_i = 6,
	Frame_l = 10,		
	Delay = 0.25

}
	
	DeepCopy(params, p2)
	DeepCopy(params, p3)

	PSX_BGA_Globals["BGA_TileTool"]( t, params )

	p2["Y_num"] = 0
	p2["Frame_i"] = 11
	p2["Frame_l"] = 15
	PSX_BGA_Globals["BGA_TileTool"]( t, p2 )


	p3["Y_num"] = { 1, 1 }
	PSX_BGA_Globals["BGA_TileTool"]( t, p3 )

local params_2 = {}

	DeepCopy(params, params_2)
	params_2["Y_num"] = 1
	params_2["Fade"] = { 1, 1 }
	params_2["ActorClass"] = "Quad"
	params_2["Color"] = "Rainbow"
	params_2["Commands"] = { "Fade", "Blend" }

	
	t[#t+1] = LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params_2 )..{}

return Def.ActorFrame{ t }