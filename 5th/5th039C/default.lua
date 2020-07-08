
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 9

}

return Def.ActorFrame{ 
	LoadActor("../5th039A")..{},
	LoadActor( "../Resources/Scripts/5th/LineXY.lua", params )..{}
}