
local t = Def.ActorFrame{}

local tweaks = ...

local params = {

	{
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		Commands = "Mirror",
		BGMirror = true,
		X_num = 1
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/C 5x1.png",
		Frame_l = 5,
		Commands = "FramePerSprite",
		Rot = true,
		Skip = true,
		Clockwise = true,
		Script = "/BGAnimations/Resources/Scripts/1st/SpaceEffects/Spiral.lua"
	}

}

	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params[1] )
	t[#t+1] = loadfile( params[2]["Script"] )( params[2] )


return Def.ActorFrame{ t }