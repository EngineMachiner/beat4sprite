
local params = {
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath()
}

return Def.ActorFrame{
    LoadActor( "../Resources/Scripts/5th/KA.lua", params )..{}	
}