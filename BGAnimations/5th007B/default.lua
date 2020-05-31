
local tweaks = {

	Index = 1,
	X_num = { -4, 5 },
	X_coord = -1,
	Commands = { "StairsStates", "Move" },
	Delay = 1

}

return Def.ActorFrame{

	LoadActor( "/BGAnimations/5th007A", tweaks )..{}

}