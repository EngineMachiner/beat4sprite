
local t = Def.ActorFrame{}

	t[#t+1] = LoadActor( "../5th034C" )..{}

local params = {

	{	
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/D 5x4.png",
		Y_num = 2,
		X_num = 5,
		Frame_i = 6,
		Frame_l = 8,		
		Delay = 0.25,
		Commands = { "Cross2" },
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	t[#t+1] = LoadActor( "../5th001A", params )..{}

local params_2 = {}

	DeepCopy(params[1], params_2)
	params_2["Fade"] = { 1, 1 }
	params_2["ActorClass"] = "Quad"
	params_2["Color"] = "Rainbow"
	params_2["Commands"] = { "Fade", "Cross2", "Blend" }

	
	t[#t+1] = LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params_2 )..{}

return Def.ActorFrame{ t }