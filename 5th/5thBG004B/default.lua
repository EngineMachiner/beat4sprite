return Def.ActorFrame{
	LoadActor( "../5thBG004A", { Index = 1, Commands = { "Mirror" } } )..{},
	LoadActor( "../Resources/Scripts/5th/RandomPos.lua", { 
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
		Frame_i = 12,
		Frame_l = 13,
		Commands = { "Rotation", "Rainbow" }
	} )
}