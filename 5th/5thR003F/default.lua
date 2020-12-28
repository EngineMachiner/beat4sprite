
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/Gradients/B006 8x8.png",
	X_num = { -3, 3 },
	Y_num = 1,
	Frame_l = 60,
	Zoom = 4,
	Delay = 8/60,
	Commands = "Mirror"
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params)..{},
}