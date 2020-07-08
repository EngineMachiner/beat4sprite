
local params = {
	File = "/BGAnimations/Resources/5th/Rainbows/G001R.mpg",
	X_num = 1
}

return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params )..{}
}