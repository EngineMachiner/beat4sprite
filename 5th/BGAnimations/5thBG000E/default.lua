
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

	t[#t+1] = LoadActor( "../Scripts/BGExtender", GAMESTATE:GetCurrentSong():GetBackgroundPath(), 0, 4 )..{}

return t