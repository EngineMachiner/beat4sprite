
local params = {
	File = "/BGAnimations/Resources/5th/Videos/B003.mpg",
	X_num = 1,
	Speed = 0.25,
	Rate = 0.5
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params)..{},
}