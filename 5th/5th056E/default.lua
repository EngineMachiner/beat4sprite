
local a = "/BGAnimations/Resources/5th/Backgrounds/BABC 2x2.png"

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th056B/default.lua" )( { 
		{ Index = 1, File = a, Frame_i = 2 }, 
		{ Index = 3, Dir = "Out" } 
	} )

}