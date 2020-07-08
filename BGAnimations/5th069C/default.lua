
local params = {
	Index = 1,
	Script = "../Resources/5th/Scripts/Z_Effects/Stairs.lua",
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 2,
	Dir = "Out"
}

return Def.ActorFrame{

	LoadActor("../5th069A")..{},
	LoadActor( params.Script, params )..{}

}