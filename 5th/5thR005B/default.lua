
local s = "/BGAnimations/Resources"
local params = {
	Index = 1,
	File = s .. "/5th/Sprites/Gradients/D001 8x8.png",
	X_num = { -2, 1 },
	Y_num = 1,
	Frame_l = 60,
	Zoom = 4,
	Commands = { "Move" },
	Cleanup = true,
	Y_coord = 1
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th004A/default.lua" )( params )
}