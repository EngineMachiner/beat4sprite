
local s = "/BGAnimations/Resources"
local params = { 
	File = s .. "/5th/Sprites/DABC 4x4.png",
	Frame_i = 3,
	Frame_l = 4
}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th007B/default.lua" )(),
	loadfile( s .. "/Scripts/LineXY.lua" )( params )

}