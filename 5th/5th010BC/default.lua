local params = {}

params.AddActors = {} 

params.AddActors[#params.AddActors+1] = PSX_BGA_Globals["BGA_IQB"]()

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th010AC", params)..{},

}