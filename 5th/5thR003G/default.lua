
local params = {
	File = "/BGAnimations/Resources/Rainbows/B007.mpg",
	X_num = 1,
	Speed = 0.25
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params)..{},
}