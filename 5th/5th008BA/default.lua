local tweaks = {

	Remove = true

}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/A 4x3.png",
	Frame_i = 5,
	Frame_l = 6

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th008AA/default.lua" )( tweaks ),
	loadfile( "/BGAnimations/Resources/Scripts/LineXY.lua" )( params )

}