
local params = {
	Index = 1,
	Actors = BGA_G.IDest_Quad()
}

return Def.ActorFrame{
	loadfile( "/BGAnimations/5th010AC/default.lua" )( params )
}