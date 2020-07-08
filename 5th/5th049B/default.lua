
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 9,
	Dir = "Right"
}

return Def.ActorFrame{
	LoadActor( "../5th049A" )..{},
	LoadActor( "../Resources/5th/Scripts/Particles.lua", params )..{}
}