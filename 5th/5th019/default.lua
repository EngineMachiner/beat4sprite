
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/ABC 4x4.png",
		Frame_i = 13,
		Frame_l = 16,
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

return Def.ActorFrame{ t }