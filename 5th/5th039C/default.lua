
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9

}

return Def.ActorFrame{ 
	loadfile( "/BGAnimations/5th039A/default.lua" )(),
	loadfile( "/BGAnimations/Resources/Scripts/LineXY.lua" )( params )
}