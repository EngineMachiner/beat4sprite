
local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local params = {

	{
		X_num = 2,
		Index = 1,
		X_coord = 0
	}	

}

	t[#t+1] = loadfile( "/BGAnimations/5th034A/default.lua" )( params )

local params = {
	File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12,
	X_num = 5,
	Y_num = 1,
	X_coord = -1,
	HurryTweenBy = 2,
	Commands = { "Move" }
}

	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )

return Def.ActorFrame{ t }