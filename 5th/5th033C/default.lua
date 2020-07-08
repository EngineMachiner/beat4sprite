
local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self.Name = "SearchIndex"
	end

}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/D 5x4.png",
	Y_num = { -2, 1 },
	X_num = 5,
	Delay = 0.25,
	FramingXY = true

}

	t[#t+1] = LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params )..{}

local params_2 = {}

	DeepCopy(params, params_2)
	params_2["Fade"] = { 1, 1 }
	params_2["ActorClass"] = "Quad"
	params_2["Color"] = "Rainbow"
	params_2["Commands"] = "Fade"

	
	t[#t+1] = LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params_2 )..{}

return Def.ActorFrame{ t }