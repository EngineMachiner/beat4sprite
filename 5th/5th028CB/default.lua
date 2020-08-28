local tweaks = {

	{
		Index = 3,
		Script = "../Resources/Scripts/5th/Z_Effects/R_WhirlTrace"
	},

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 16,
		Color = color("#808080"),
		FDelay = 4,
		Commands = { "Move", "Fade" }
	}
	
}

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th028B",tweaks)..{}

}

return Def.ActorFrame{ t }