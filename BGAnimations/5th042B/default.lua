
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	Frame_i = 3,

}

local tweaks = {

	Index = 3,
	Remove = true

}

return Def.ActorFrame{

	LoadActor( "../5th042A", tweaks )..{},
	LoadActor( "../Resources/Scripts/Z_Effects/SpiralTrace.lua", params )..{}

}