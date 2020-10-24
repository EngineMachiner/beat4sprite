--Add actors only if the main Def.ActorFrames has the loop or function to add them
local params = {}

params.AddActors = {} 
params.AddActors[#params.AddActors+1] = PSX_BGA_Globals["BGA_IQB"]()

return Def.ActorFrame{

	LoadActor("/BGAnimations/5th010AA", params)..{},

}