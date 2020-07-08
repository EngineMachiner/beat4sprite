local params = {

	Index = 1,
	Frame_i = 16,
	Frame_l = 13,
	Y_coord = -1,
	Y_pos = 0,
	Y_num = 2,
	Commands = { "Move" }

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th022AD",params)..{}
	
}