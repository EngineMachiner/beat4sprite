
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/Gradients/B001 5x3.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_l = 15,
		Delay = 4/15,
		Zoom = 1.5,
		Commands = { "Rainbow", "Mirror" }
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/G 4x4.png",
		Frame_l = 8,
		Delay = 2/8,
		Dir = "Out",
		Zoom = 0.93*2,
		ZSpacing = 3,
		Commands = "Blend",
		Blend = "BlendMode_Add",
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/SpiralTrace.lua"
	}

} 

	local params_3 = {}
	DeepCopy( params[2], params_3 )	
	params_3["Index"] = 3
	params_3["SpinAng"] = 180

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )
	t[#t+1] = LoadActor( params_3["Script"], params_3 )..{}	

return Def.ActorFrame{ t }