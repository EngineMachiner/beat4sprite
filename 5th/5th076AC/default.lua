
local tweaks = ...

local params = {

	{
		Index = 1,
		File ="/BGAnimations/Resources/5th/Sprites/DA 4x3.png",
		Frame_i = 11,
		Frame_l = 12,
		X_num = { -5, 4 },
		Y_num = 1
	},

	{
		Index = 2,
		File ="/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 9,
		Clockwise = true
	},

	{	
		Index = 3,
		File ="/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		Frame_i = 9,
		Dir = "Out",
		Clockwise = false
	}

}

	BGA_G.ParTweak(params, tweaks)
	
return Def.ActorFrame{

	LoadActor("../Resources/Scripts/TileTool.lua", params[1])..{},
	LoadActor("../Resources/Scripts/SpaceEffects/RoundTrace.lua", params[2])..{
		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2] * 8
			self:sleep(d):diffusealpha(0)
			self:sleep(d):diffusealpha(1)
			self:queuecommand("Repeat")
		end		
	},
	LoadActor("../Resources/Scripts/SpaceEffects/RoundTrace.lua", params[3])..{
		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')
			self:diffusealpha(0)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2] * 8
			self:sleep(d):diffusealpha(1)
			self:sleep(d):diffusealpha(0)
			self:queuecommand("Repeat")
		end		
	}

}