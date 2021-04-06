local count = 0
local tweaks = ...

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local params = {

	File = {
		"/BGAnimations/Resources/5th/Backgrounds/DA2.png",
		"/BGAnimations/Resources/5th/Backgrounds/DA.png"
	},
	Y_coord = 1,
	X_num = 1,
	Commands = "Move",
	Cleanup = true

}
	
 	count = count + 1
 	params.Index = count
	BGA_G.ParTweak( params, tweaks ) 
	BGA_G.Tile( t, params )

return Def.ActorFrame{ t }