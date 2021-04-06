
local params = {
	{
		Index = 1,
		X_num = { -2, 1 },
		X_coord = 1
	}
}

return Def.ActorFrame{
	LoadActor( "../5th034A", params ),
	BGA_G.IDest_Quad()
}