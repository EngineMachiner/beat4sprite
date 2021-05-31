
local replace = ...

local t = Def.ActorFrame{}
local s = "/BGAnimations/Resources"

local tweaks = {

	{ 
		Index = 1,
		File = s .. "/5th/Sprites/AB 4x4.png",
		Frame_i = 7,
		Frame_l = 8,
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}


	t[#t+1] = loadfile( "/BGAnimations/5th001A/default.lua" )( tweaks )


local params = {

	Index = 1,
	File = s .. "/5th/Sprites/ABC 4x4.png",
	X_num = { -5, 4 },
	Y_num = { -2, 1 },
	Frame_i = 5,
	Frame_l = 8,
	Commands = "RandomDelays"

}

	BGA_G.ParTweak( params, replace )

	t[#t+1] = loadfile( s .. "/Scripts/TileTool.lua" )( params )

	if replace then 
		if replace.Remove then 
			t[#t] = nil 
		end
	end


return Def.ActorFrame{ t }