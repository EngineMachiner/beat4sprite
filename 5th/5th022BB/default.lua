local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/HSV/DAB 4x4.png",
	Frame_i = 9,
	Frame_l = 12,
	Commands = "OneTwoStates"

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th022AD",params)..{}
	
}