
local params = {
	Index = 1,
	Actors = { BGA_G.IDest_Quad() }
}

return Def.ActorFrame{
	LoadActor("/BGAnimations/5th010AA", params)..{}
}