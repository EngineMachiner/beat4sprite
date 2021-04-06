local params = {

	Index = 1,
	Frame_i = 13,
	Frame_l = 16,
	Y_coord = -1,
	Y_num = 2,
	HurryTweenBy = 2,
	Commands = { "Move" }

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th022AD",params)..{}
	
}