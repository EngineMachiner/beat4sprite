
local replace = ...

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(true)
		end )
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(120)
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
		end )
	end
}

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	X_num = 2,
	Y_num = 1,
	Commands = { "Mirror", "FourScreens" },
	BGMirror = true
}

	BGA_ParamsTweaks( params, replace )

	if params.AddActors then
		for k,v in pairs(params.AddActors) do
			t[#t+1] = v
		end
	end

return Def.ActorFrame{
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params )..{},
	t
}