local params = {}

params.AddActors = {} 

params.AddActors[#params.AddActors+1] = BGA_IQB()

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th010AC", params)..{},

}