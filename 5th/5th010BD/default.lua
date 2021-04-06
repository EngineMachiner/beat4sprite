
local params = {
	Index = 1
}

params.Actors = {} 
params.Actors[#params.Actors+1] = BGA_G.IDest_Quad()

return Def.ActorFrame{
	LoadActor("/BGAnimations/5th010AD", params)..{}
}