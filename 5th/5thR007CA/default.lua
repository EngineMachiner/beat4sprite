
local params = {
	File = "/BGAnimations/Resources/5th/Videos/F003R.mpg",
	X_num = 1
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}
}