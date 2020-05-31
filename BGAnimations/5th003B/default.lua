
local t = Def.ActorFrame{}

local tweaks = {

	Index = 1,
	ResetParams = true,
	File = "/BGAnimations/Resources/5th/Sprites/CA 4x3.png",
	X_num = { -4, 3 },
	Y_num = 1,
	Frame_i = 4,
	Frame_l = 6

}

	t[#t+1] = LoadActor( "/BGAnimations/5th003A", tweaks )..{}

return Def.ActorFrame{ t }