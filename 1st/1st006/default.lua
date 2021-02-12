
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/1st/Sprites/HComb 1x3.png",
		Zoom = 0.5,
		X_num = 1,
		Y_num = 3,
		Frame_l = 3,
		Delay = 1,
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/HComb2 1x3.png",
		Zoom = 1.5,
		Frame_i = 1,
		Frame_l = 3,
		X_num = 1,
		Y_num = 1,
		Delay = 1
	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		Frame_i = 17,
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/Line",
		Num = 4
	}

} 

	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[2] )

	t[2]["On2Command"] = function(self)
		self:diffusealpha(1):sleep(4):diffusealpha(0):sleep(4):diffusealpha(1)
		self:queuecommand("On2")
	end

	t[2]["OnCommand"] = function(self)
		self:effectclock("beat")
		self:set_tween_uses_effect_delta(true)
		self:queuecommand("On2")
	end

	t[#t+1] = Def.Quad{
		OnCommand=function(self)
			self:Center():FullScreen()
			self:diffuse(Color.Black)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			self:queuecommand("On2")
		end,
		On2Command=function(self)
			self:diffusealpha(0):sleep(3):diffusealpha(1):sleep(1):diffusealpha(0)
			self:queuecommand("On2")
		end
	}

	t[#t+1] = LoadActor( params[3]["Script"], params[3] )

return Def.ActorFrame{ t }