
local replace = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/ABCDE 1x4.png",
		X_num = 1,
		Y_num = { -2, 1 },
		Frame_l = 4,
		Cleanup = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	BGA_G.ParTweak( params, replace )

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/ABC 4x4.png",
	Frame_l = 4,
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Commands = { "RandomDelays" }
	
}

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th001A",params)..{}

}

if replace then
	BGA_G.ParTweak( params_2, replace )
	BGA_G.Tile( t, params_2 )
else
	BGA_G.Tile( t, params_2 )
end

return Def.ActorFrame{ t }