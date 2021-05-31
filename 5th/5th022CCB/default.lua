local params = {

	Index = 1,
	Frame_i = 16,
	Frame_l = 13,
	Y_coord = 1,
	Y_num = 2,
	HurryTweenBy = 2,
	Commands = { "Move" }

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th022AD/default.lua" )( params )
	
}