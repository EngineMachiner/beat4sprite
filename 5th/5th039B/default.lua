
local s = "/BGAnimations/Resources"
local params = {

	File = s .. "/5th/Sprites/DA 4x3.png",
	Frame_i = 1,
	Frame_l = 2

}

return Def.ActorFrame{ 
	loadfile( "/BGAnimations/5th039A/default.lua" )(),
	loadfile( s .. "/Scripts/SpaceEffects/Stairs.lua" )( params )
}