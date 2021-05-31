return Def.ActorFrame{
	
	loadfile( "/BGAnimations/5th065/default.lua" )( { 

		{
			Index = 1, 
			File = GAMESTATE:GetCurrentSong():GetBackgroundPath()
		},

		{
			Index = 2, 
			File = "/BGAnimations/Resources/5th/Backgrounds/A.png"		
		}

	} )
}