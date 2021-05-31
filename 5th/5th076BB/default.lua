
local tweaks = {

	Index = 2,
	Dir = "Out",
	Clockwise = false

}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th076BA/default.lua" )( tweaks )
}