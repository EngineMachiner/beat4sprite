
local tweaks = {

	Index = 1,
	X_num = { -4, 5 },
	X_coord = -1,
	Commands = "Move"

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th008AA/default.lua" )( tweaks )

}