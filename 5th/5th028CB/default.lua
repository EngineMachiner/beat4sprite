local tweaks = {

	{
		Index = 3,
		Script = "../Resources/Scripts/SpaceEffects/Whirl"
	},

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 16,
		Commands = { "Move", "Alpha" }

	}
	
}

return Def.ActorFrame{ 
	LoadActor("/BGAnimations/5th028B",tweaks)..{}
 }