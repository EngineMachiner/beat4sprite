
local params = {
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath()
}

return Def.ActorFrame{
    loadfile( "/BGAnimations/Resources/Scripts/Kaleidoscopes/Main.lua" )( params )
}