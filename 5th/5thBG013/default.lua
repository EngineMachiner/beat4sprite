
local replace = ...

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(true)
		end )
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(120)
	end,
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
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

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

	if params.AddActors then
		for k,v in pairs(params.AddActors) do
			t[#t+1] = v
		end
	end

return Def.ActorFrame{
	LoadActor( "../Resources/Scripts/TileTool.lua", params )..{},
	t
}