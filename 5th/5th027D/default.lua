local tweaks = {

	Index = 3,
	Remove = true
	
}

local params = {

	Index = 4,
	File = "/BGAnimations/Resources/5th/Sprites/ABC 4x4.png",
	Frame_l = 4
	
}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th027A/default.lua" )( tweaks ),
	loadfile( "/BGAnimations/Resources/Scripts/SpiralStaticTrace.lua" )( params )

}