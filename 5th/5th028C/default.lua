local tweaks = {

	Index = 3,
	Script = "../Resources/5th/Scripts/Z_Effects/R_WhirlTrace"
	
}

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th028B",tweaks)..{}

}

return Def.ActorFrame{ t }