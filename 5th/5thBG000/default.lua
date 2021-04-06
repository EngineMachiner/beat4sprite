
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
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local params = {
	Index = 1,
	File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true
}

	BGA_G.ParTweak( params, replace )
	BGA_G.Tile( t, params )

return Def.ActorFrame{
	t
}