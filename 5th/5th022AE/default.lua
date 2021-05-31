
local params = {

	Index = 1,
	Frame_i = 13,
	Frame_l = 16,
	Commands = "Move",
	X_coord = -1

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th022AD/default.lua" )( params )
	
}