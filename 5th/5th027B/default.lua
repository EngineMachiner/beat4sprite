
local tweaks = {

	Index = 3,
	Commands = { "SpinY", "RandomDelays" }
	
}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th027A/default.lua" )( tweaks )

}