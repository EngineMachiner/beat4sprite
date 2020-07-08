
local params = {
	Index = 1,
	File = "/BGAnimations/Resources/Rainbows/D001.mpg",
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