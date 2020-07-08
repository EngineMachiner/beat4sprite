local params = {

	Index = 1,
	Frame_i = 13,
	Frame_l = 16,
	Commands = "OneTwoStates"

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th022AD",params)..{}
	
}