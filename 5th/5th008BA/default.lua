local tweaks = {

	Remove = true

}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/A 4x3.png",
	Frame_i = 5,
	Frame_l = 6

}

return Def.ActorFrame{

	LoadActor( "/BGAnimations/5th008AA", tweaks )..{},
	LoadActor( "../Resources/Scripts/5th/LineXY.lua", params )..{}

}