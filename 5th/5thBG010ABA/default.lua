
local s = "/BGAnimations/Resources"
return Def.ActorFrame{

	loadfile( "/BGAnimations/5thBG010/default.lua" )( { 
		Index = 1, Beat = 0.5 
	} ),

	loadfile( s .. "/Scripts/RandomPos.lua" )( { 
		File = s .. "/5th/Sprites/HSV/DAB2 4x4.png",
		Frame_i = 12,
		Frame_l = 13,
		Commands = { "Rotation", "Rainbow" }
	} )
	
}