local t = Def.ActorFrame{}

local tweaks = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/B 4x3.png",
	Frame_i = 1,
	Frame_l = 6,
	Dir = "Left",
	Script = "/BGAnimations/Resources/Scripts/5th/Particles.lua",
	Random = true

}

	t[#t+1] = LoadActor( "/BGAnimations/5th005", tweaks )..{}


return Def.ActorFrame{ t }