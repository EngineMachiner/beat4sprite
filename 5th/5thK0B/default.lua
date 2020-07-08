
local params = {
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	Reversed = true
}

return Def.ActorFrame{
    LoadActor( "../Resources/5th/Scripts/KA.lua", params )..{}	
}