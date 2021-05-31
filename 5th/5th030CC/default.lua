
local tweaks = {

	Index = 3,
	Dir = "Out",
	Flat = true

}

return Def.ActorFrame{ 
	loadfile( "/BGAnimations/5th030C/default.lua" )( tweaks )
}