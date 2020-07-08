
local params = {

	Index = 1,
	Frame_i = 13,
	Frame_l = 16,
	Y_num = 2, 
	X_num = 5, 
	Commands = "Move",
	X_coord = -1,
	Y_coord = -1,
	Delay = 0.25

}

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th022AD",params)..{}
	
}