
local params = {
	File = "/BGAnimations/Resources/5th/Videos/C002.mpg",
	X_num = 1
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}