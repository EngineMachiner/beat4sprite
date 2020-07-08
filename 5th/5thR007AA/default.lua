
local params = {
	File = "/BGAnimations/Resources/Rainbows/F001R.mpg",
	X_num = 1
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}