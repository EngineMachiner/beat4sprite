local params = {

	Index = 1,
	Frame_i = 16,
	Frame_l = 13,
	Commands = "LStates"

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th022AD/default.lua" )( params )
	
}