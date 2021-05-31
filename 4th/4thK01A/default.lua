

local args = ...

local params = {

	{	
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath()
	},

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
		Frames = { 2, 15 },
		Dir = "Up",
		Blend = "BlendMode_Add",
		Color = "Rainbow",
		RainbowPattern = 2,
		Num = 18 * 3
	}

}

	BGA_G.ParTweak( params, args )

local s = "/BGAnimations/Resources/Scripts/"
return Def.ActorFrame{

	GainFocusCommand=function(self)
        BGA_G.Stop( self, true )
    end,
    LoseFocusCommand=function(self)
        BGA_G.Stop( self )
    end,

	loadfile( s .. "Kaleidoscopes/Main.lua" )( params[1] ),
	Def.ActorFrame{
		loadfile( "/BGAnimations/Resources/4th/Sprites/Gradients/B.png" ),
		OnCommand=function(self)
			self:FullScreen()
			self:zoom( self:GetZoom() * 2 ) 
			self:effectclock("beat")
			self:diffuse(color("#0000FF"))
			self:blend("BlendMode_WeightedMultiply")
			self:spin()
			self:effectmagnitude(0,0,-45*0.5)
		end,
	},

	loadfile( s .. "Particles.lua" )( params[2] )
	
}