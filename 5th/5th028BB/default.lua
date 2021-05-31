
local tweaks = {

	Index = 3,
	Speed = 0.5
	
}

local t = Def.ActorFrame{

	loadfile( "/BGAnimations/5th028B/default.lua" )( tweaks )

}

return Def.ActorFrame{ t }