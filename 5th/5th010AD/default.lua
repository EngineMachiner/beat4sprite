
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
		Frame_i = 1,
		Frame_l = 4,
		X_num = { -5, 4 },
		X_coord = 1
	}

}

local params_2 = {}

	DeepCopy(params, params_2)
	params_2[1]["Fade"] = { 1, 1 }
	params_2[1]["ActorClass"] = "Quad"
	params_2[1]["Color"] = "Rainbow"
	params_2[1]["Commands"] = { "Fade" }

	BGA_ParamsTweaks( params, replace )

return Def.ActorFrame{

	OnCommand=function(self)
		self.Name = "SearchStart"
	end,
	LoadActor("/BGAnimations/5th010AA", params)..{},
	LoadActor("/BGAnimations/5th010AA", params_2)..{}

}