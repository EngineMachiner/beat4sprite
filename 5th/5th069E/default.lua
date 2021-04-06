
local params = {
	Index = 1,
	Script = "../Resources/Scripts/SpaceEffects/Spiral.lua",
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 2,
	Rotation = true
}

return Def.ActorFrame{

	LoadActor("../5th069A")..{},
	LoadActor( params.Script, params )..{}

}