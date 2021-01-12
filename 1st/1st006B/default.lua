
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/HComb 1x4.png",
		Zoom = 0.666,
		X_num = 1,
		Y_num = 3,
		Frame_l = 4,
		Delay = 0.5
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/HComb2 1x4.png",
		Zoom = 2,
		Frame_l = 4,
		X_num = 1,
		Y_num = 1,
		Delay = 0.5
	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/1st/Backgrounds/A.png",
		X_num = 1,
		Commands = "Color",
		Color = color("#f80060")
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )

	t[2]["On2Command"] = function(self)
		self:effectclock("beat")
		self:set_tween_uses_effect_delta(true)
		self:diffusealpha(0):sleep(4):diffusealpha(1):sleep(4):diffusealpha(0)
		self:queuecommand("On2")
	end

	t[2]["OnCommand"] = function(self)
		self:queuecommand("On2")
	end

	PSX_BGA_Globals["BGA_TileTool"]( t, params[3] )

return Def.ActorFrame{ t }