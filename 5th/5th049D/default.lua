
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	Frame_i = 9,
	Frame_l = 10,
	Commands = "TwoSprites"
}

return Def.ActorFrame{
	LoadActor( "../5th049A" )..{},
	LoadActor( "../Resources/Scripts/5th/LineXY.lua", params )..{}
}