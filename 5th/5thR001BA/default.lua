
local s = "/BGAnimations/Resources"
return Def.ActorFrame{

	loadfile("/BGAnimations/5thR001A/default.lua")(),
	loadfile( s .. "/Scripts/SpaceEffects/RoundTrace.lua" )( {
		File = s .. "/5th/Sprites/DABCDE 4x3.png",
		Frame_i = 1,
		Frame_l = 12
	} )

}