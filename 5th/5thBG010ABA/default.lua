return Def.ActorFrame{
	LoadActor( "../5thBG010", { Index = 1, Beat = 0.5 } )..{},
	LoadActor( "../Resources/Scripts/RandomPos.lua", { 
		File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB2 4x4.png",
		Frame_i = 12,
		Frame_l = 13,
		Commands = { "Rotation", "Rainbow" }
	} )
}