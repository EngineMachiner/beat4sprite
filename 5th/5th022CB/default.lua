local params = {

	Index = 1,
	Frame_i = 13,
	Frame_l = 16,
	Y_coord = 1,
	Y_pos = 0,
	Y_num = 2,
	ScrollSpeed = 2,
	Commands = { "OneTwoStates", "Move" }

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th022AD",params)..{}
	
}