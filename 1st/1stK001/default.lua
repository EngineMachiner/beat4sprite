
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
		Delay = 0.25,
		Zoom = 1.875,
		IRot = 90,
		ZSpacing = 4,
		Remainder = 6 * 4 + 3,
		Speed = 2,
		Script = "../Resources/Scripts/1st/Z_Effects/SpiralTrace.lua"
	}

} 

	local params_3 = {}
	DeepCopy( params[2], params_3 )	
	params_3["Index"] = 3
	params_3["SpinAng"] = 180

    t[#t+1] = LoadActor( "../Resources/Scripts/1st/KA.lua", params[1] )..{}	
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )..{}
	t[#t+1] = LoadActor( params_3["Script"], params_3 )..{}	

return Def.ActorFrame{ t }