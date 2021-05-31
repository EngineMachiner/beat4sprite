
local params = {
	Index = 1,
	Commands = { "Rainbow", "Mirror" }
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5thBG002A/default.lua" )( params )
}