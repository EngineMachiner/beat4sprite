
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 10,
	Dir = "Down"
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th049A/default.lua" )(),
	loadfile( "/BGAnimations/Resources/Scripts/Particles.lua" )( params )
}