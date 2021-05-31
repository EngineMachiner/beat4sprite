
local params = {
	Index = 1,
	Script = "/BGAnimations/Resources/Scripts/SpaceEffects/Spiral.lua",
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 2,
	Dir = "Out"
}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th069A/default.lua" )(),
	loadfile( params.Script )( params )

}