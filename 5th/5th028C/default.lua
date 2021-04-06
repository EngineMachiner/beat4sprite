local tweaks = {

	Index = 3,
	Script = "../Resources/Scripts/SpaceEffects/Whirl"
	
}

local t = Def.ActorFrame{

	LoadActor("/BGAnimations/5th028B",tweaks)..{}

}

return Def.ActorFrame{ t }