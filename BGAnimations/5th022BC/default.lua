local params = {

	Index = 1,
	Frame_i = 16,
	Frame_l = 13,
	Commands = "OneTwoStates"

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th022AD",params)..{}
	
}