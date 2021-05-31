
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 3,

}

local tweaks = {

	Index = 3,
	Remove = true

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th042A/default.lua" )( tweaks ),
	loadfile( "/BGAnimations/Resources/Scripts/SpaceEffects/Spiral.lua" )( params )

}