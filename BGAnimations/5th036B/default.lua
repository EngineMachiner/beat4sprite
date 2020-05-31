
local tweaks = {

	{
		Index = 1,
		X_coord = 0,
		Y_coord = 0,
		X_num = { -4, 5 },
		Y_num = { -2, 1 }
	},

	{
		Index = 3,
		X_coord = -1,
		Y_coord = -1,
		X_pos = -0.5,
		X_num = 5,
		Y_num = 2,
		Delay = 2,
		Commands = "Move"
	}

}

return Def.ActorFrame{

	LoadActor( "../5th036A", tweaks )..{}

}