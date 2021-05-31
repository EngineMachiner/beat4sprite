
local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 13,
		X_num = 4,
		Y_num = 2,
		X_coord = -1,
		Y_coord = -1,
		Commands = "Move",
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	local s = "/BGAnimations/5th001A/default.lua"
	t[#t+1] = loadfile( s )( params )


	params[1]["Color"] = Color.Red

	-- Fade is the direction of the fading (like a tangent)
	params[1]["Fade"] = { 1, -1 } 

	params[1]["Class"] = "Quad"
	params[1]["Commands"] = { "Move", "Fade", "Blend" }

	t[#t+1] = loadfile( s )( params )


local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 1,
	Frame_l = 2

}

	t[#t+1] = loadfile("/BGAnimations/Resources/Scripts/LineXY.lua" )( params )


return Def.ActorFrame{ t }
