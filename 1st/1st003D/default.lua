
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

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
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/B001 5x3.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_l = 15,
		Delay = 0.5,
		Zoom = 1.5,
		Commands = { "Rainbow", "Mirror" }
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/G 4x4.png",
		Frame_l = 8,
		Dir = "Out",
		ZSpacing = 3,
		Slices = 4,
		FrmDelay = 0.5,
		Zoom = 1.5,
		Commands = "Blend",
		Blend = "BlendMode_Add",
		Script = "/BGAnimations/Resources/Scripts/1st/SpaceEffects/Spiral.lua"
	}

} 

	local params_3 = {}
	DeepCopy( params[2], params_3 )	
	params_3["Index"] = 3
	params_3["SpinAng"] = 180

	BGA_G.Tile( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )
	t[#t+1] = LoadActor( params_3["Script"], params_3 )..{}	

return Def.ActorFrame{ t }