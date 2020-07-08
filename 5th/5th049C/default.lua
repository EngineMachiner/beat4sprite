
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 10,
	Dir = "Down"
}

return Def.ActorFrame{
	LoadActor( "../5th049A" )..{},
	LoadActor( "../Resources/Scripts/5th/Particles.lua", params )..{}
}