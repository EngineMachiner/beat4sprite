
local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Rainbows/D001R.mpg",
	X_num = 1,
	Y_num = { -1, 0 },
	Delay = 4,
	ResetParams = true,
	Y_coord = 1,
	Commands = "Move"
}

return Def.ActorFrame{
	LoadActor( "../5th004A", params )..{}
}