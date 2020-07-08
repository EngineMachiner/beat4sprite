
local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self.Name = "SearchIndex"
	end

}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/D 5x4.png",
	Y_num = { -3, 4 },
	X_num = { -7, 3 },
	Delay = 0.25,
	FramingXY = true,
	Commands = "Move",
	Y_coord = 1,
	X_coord = 1,

}

	t[#t+1] = LoadActor( "/BGAnimations/Resources/5th/Scripts/TileTool.lua", params )..{}

local params_2 = {}

	DeepCopy(params, params_2)
	params_2["Fade"] = { 1, 1 }
	params_2["ActorClass"] = "Quad"
	params_2["Color"] = "Rainbow"
	params_2["Commands"] = { "Move", "Fade" }

	
	t[#t+1] = LoadActor( "/BGAnimations/Resources/5th/Scripts/TileTool.lua", params_2 )..{}

return Def.ActorFrame{ t }