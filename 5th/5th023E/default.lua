local params = {

	Index = 1,
	Frame_i = 9,
	Frame_l = 10,
	Commands = "NoAnimation"

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th023C/default.lua" )( params ),

}