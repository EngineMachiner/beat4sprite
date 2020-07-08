
local params = {
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	Reversed = true
}

return Def.ActorFrame{
    LoadActor( "../Resources/Scripts/5th/KA.lua", params )..{}	
}