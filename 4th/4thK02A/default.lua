

local args = ...

local s = "/BGAnimations/Resources"
local params = {

	{	
		Index = 1,
		File = s .. "/4th/Backgrounds/F2.png",
	},

	{	
		Index = 2,
		File = s .. "/4th/Sprites/BAB 5x4.png",
		Frames = 2,
		X_num = 6,
		Y_num = 2,
		TCV = { -1, -1 }
	}

}

	BGA_G.ParTweak( params, args )
	
s = s .. "/Scripts"
return Def.ActorFrame{

	GainFocusCommand=function(self)
        BGA_G.Stop( self, true )
    end,
    LoseFocusCommand=function(self)
        BGA_G.Stop( self )
    end,

	loadfile( s .. "/Kaleidoscopes/Main.lua" )( params[1] ),
	loadfile( s .. "/TileTool.lua" )( params[2] )
	
}