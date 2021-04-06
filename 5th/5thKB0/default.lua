
local params = {
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath()
}

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/Kaleidoscopes/Comb.lua", params )..{}
}