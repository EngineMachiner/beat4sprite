local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Backgrounds/C.png"
	},

	{
		Index = 2,
		Y_coord = 1
	}

}

return Def.ActorFrame{

	loadfile( "/BGAnimations/5th017AA/default.lua" )( params )

}