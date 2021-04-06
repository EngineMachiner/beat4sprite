
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
	Frame_l = 10

}
	
	DeepCopy(params, p2)
	DeepCopy(params, p3)

	BGA_G.Tile( t, params )

	p2["Y_num"] = 0
	p2["Frame_i"] = 11
	p2["Frame_l"] = 15
	BGA_G.Tile( t, p2 )


	p3["Y_num"] = { 1, 1 }
	BGA_G.Tile( t, p3 )

local params_2 = {}

	DeepCopy(params, params_2)
	params_2["Y_num"] = 1
	params_2["Fade"] = { 1, 1 }
	params_2["Class"] = "Quad"
	params_2["Color"] = "Rainbow"
	params_2["Commands"] = { "Fade", "Blend" }

	
	t[#t+1] = LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params_2 )..{}

return Def.ActorFrame{ t }