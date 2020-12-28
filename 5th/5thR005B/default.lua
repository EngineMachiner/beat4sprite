
local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/Gradients/D001 8x8.png",
	X_num = { -2, 1 },
	Y_num = 1,
	Frame_l = 60,
	Zoom = 4,
	Delay = 4/60,
	Commands = { "Mirror", "Move" },
	ResetParams = true,
	Y_coord = 1
}

return Def.ActorFrame{
	LoadActor( "../5th004A", params )..{}
}