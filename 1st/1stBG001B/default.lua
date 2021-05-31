
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
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		Frame_i = 6,
		Frame_l = 13,
		Zoom = 0.8,
		Delay = 0.75,
		Script = "/BGAnimations/Resources/Scripts/1st/SpaceEffects/Stairs.lua"
	}

}

	BGA_G.ParTweak( params, tweaks )
	BGA_G.Tile( t, params[1] )
	t[#t+1] = loadfile( params[2]["Script"] )( params[2] )


return Def.ActorFrame{ t }