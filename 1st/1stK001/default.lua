
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
		Zoom = 1.875,
		IRot = 90,
		Remainder = 8,
		Rot = true,
		Speed = 2,
		Script = "../Resources/Scripts/1st/SpaceEffects/Spiral.lua"
	}

} 

	local params_3 = {}
	DeepCopy( params[2], params_3 )	
	params_3["Index"] = 3
	params_3["SpinAng"] = 180
	params_3["IRot"] = 90

    t[#t+1] = LoadActor( "../Resources/Scripts/Kaleidoscopes/Main.lua", params[1] )..{}	
	t[#t+1] = LoadActor( params[2]["Script"], params[2] )..{}
	t[#t+1] = LoadActor( params_3["Script"], params_3 )..{}	

return Def.ActorFrame{ t }