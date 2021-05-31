local tweaks = {

	Index = 3,
	Script = "/BGAnimations/Resources/Scripts/SpaceEffects/Whirl.lua"
	
}

local t = Def.ActorFrame{

	loadfile( "/BGAnimations/5th028B/default.lua" )( tweaks )

}

return Def.ActorFrame{ t }