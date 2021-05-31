
local params = {
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	Reversed = true
}

return Def.ActorFrame{
    loadfile( "/BGAnimations/Resources/Scripts/Kaleidoscopes/Main.lua" )( params )
}