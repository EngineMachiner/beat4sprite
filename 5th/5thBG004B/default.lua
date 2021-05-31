
local s = "/BGAnimations/Resources"
return Def.ActorFrame{

	loadfile( "/BGAnimations/5thBG004A/default.lua" )( { 
		Index = 1, Commands = { "Mirror" } 
	} ),

	loadfile( s .. "/Scripts/RandomPos.lua" )( { 
		File = s .. "/5th/Sprites/HSV/DAB2 4x4.png",
		Frame_i = 12,
		Frame_l = 13,
		Commands = { "Rotation", "Rainbow" }
	} )
	
}