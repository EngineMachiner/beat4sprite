
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/D2.png",
		X_num = { 0, 1 },
		Y_num = { -1, 0 },
		X_pos = 0.75,
		Zoom = 0.5,
		HurryTweenBy = 4,
		Commands = "Move",
		X_coord = -1

	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/C 5x1.png",
		Frame_l = 5,
		Commands = "FramePerSprite",
		Clockwise = true,
		Rot = true,
		Skip = true,
		Slices = 5,
		Script = "/BGAnimations/Resources/Scripts/1st/SpaceEffects/Spiral.lua"
	}

} 

	BGA_G.Tile( t, params[1] )
	t[#t+1] = loadfile( params[2]["Script"] )( params[2] )

return Def.ActorFrame{ t }