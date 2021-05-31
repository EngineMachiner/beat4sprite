
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th049A/default.lua" )(),
	loadfile( "/BGAnimations/Resources/Scripts/LineXY.lua" )( params )
}