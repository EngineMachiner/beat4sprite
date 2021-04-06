
local t = Def.ActorFrame{}
local replace = ...
local tweaks = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Backgrounds/B.png",
		X_num = { -1, 1 },
		Commands = "Mirror",
		BGMirror = true,
		Cleanup = true
	},

	{
		Index = 2
	}

}

BGA_G.ParTweak( tweaks, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

return Def.ActorFrame{ t }