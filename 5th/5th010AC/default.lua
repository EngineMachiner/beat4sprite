
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
		Frame_i = 1,
		Frame_l = 4,
		X_num = { -5, 4 },
		X_coord = 1,
		HurryTweenBy = 2,
		Commands = "Move"
	}

}

local params_2 = {}
DeepCopy(params, params_2)
local a = params_2[1]

	a.Fade = { 1, 0.5 }
	a.Class = "Quad"
	a.Color = "Rainbow"
	a.Commands = { "Blend", "Fade", "Move" }

	BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th010AA/default.lua" )( params ),
	loadfile( "/BGAnimations/5th010AA/default.lua" )( params_2 )
}