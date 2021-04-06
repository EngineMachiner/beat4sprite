
local tweaks = {

	Index = 1,
	X_num = { -4, 6 },
	X_coord = -1,
	Commands = { "StairsStates", "Move" }

}

return Def.ActorFrame{

	LoadActor( "/BGAnimations/5th007A", tweaks )..{}

}