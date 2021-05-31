local tweaks = {

	{
		Index = 3,
		Script = "/BGAnimations/Resources/Scripts/SpaceEffects/Whirl.lua"
	},

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 16,
		Commands = { "Move", "Alpha" }

	}
	
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th028B/default.lua" )( tweaks )
}