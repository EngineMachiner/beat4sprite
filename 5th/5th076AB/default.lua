
local tweaks = {

	Index = 2,
	Dir = "Out",
	Clockwise = false

}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th076AA/default.lua" )( tweaks )
}