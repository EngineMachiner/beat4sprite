
local tweaks = {

	Index = 3,
	Speed = 0.5
	
}

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th028B",tweaks)..{}

}

return Def.ActorFrame{ t }