
local params = {
	File = "/BGAnimations/Resources/5th/Rainbows/B001.mpg",
	X_num = 1,
	Speed = 0.25
}

return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params)..{},
}