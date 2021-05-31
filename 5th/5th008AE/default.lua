
local tweaks = {

	Index = 1,
	Y_num = 2,
	Y_coord = 1,
	Commands = "Move"

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th008AA/default.lua" )( tweaks )

}