
local params = {
	File = "/BGAnimations/Resources/5th/Rainbows/C001.mpg",
	X_num = 1
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}