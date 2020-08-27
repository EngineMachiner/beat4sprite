
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Backgrounds/H.png"
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/D 4x2.png",
		Frame_l = 8,
		Speed = 4,
		ZSpeed = 0.75,
		Delay = 0.25,
		Add = -10,
		RotAdd = 90
	}

} 

	local params_3 = {}
	DeepCopy( params[2], params_3 )	
	params_3["Index"] = 3
	params_3["FrameRotAdd"] = 180

    t[#t+1] = LoadActor( "../Resources/Scripts/1st/KA.lua", params[1] )..{}	
	t[#t+1] = LoadActor( "../Resources/Scripts/1st/Z_Effects/SpiralTrace.lua", params[2] )..{}
	t[#t+1] = LoadActor( "../Resources/Scripts/1st/Z_Effects/SpiralTrace.lua", params_3 )..{}	

return Def.ActorFrame{ t }