local tweaks = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frame_i = 14,
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	ResetParams = true

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th027A", tweaks)..{}

}