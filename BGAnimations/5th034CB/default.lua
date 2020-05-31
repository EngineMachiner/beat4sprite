
local params = {

	{
		Index = 1,
		X_num = { -2, 1 },
		X_coord = 1
	}
	
}

params.AddActors = {} 
params.AddActors[#params.AddActors+1] = BGA_IQB()

return Def.ActorFrame{
	LoadActor( "../5th034A", params )
}