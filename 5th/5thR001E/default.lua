
local params = {
	File = "/BGAnimations/Resources/Rainbows/A003R.mpg",
	X_num = 1
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}