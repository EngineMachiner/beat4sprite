
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		X_num = 4,
		Y_num = { -2, 1 },
		Frame_i = 4

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/M 5x4.png",
		Script = "/BGAnimations/Resources/Scripts/1st/SpaceEffects/Stairs.lua",
		Zoom = 0.5,
		Commands = "FramePerSprite",
		Frame_l = 6
	}

} 

	BGA_G.Tile( t, params[1] )
	t[#t+1] = loadfile( params[2]["Script"])( params[2] )

return Def.ActorFrame{ t }