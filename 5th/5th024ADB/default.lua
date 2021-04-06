
local tweaks = ...

local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 10,
		Cleanup = true
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 1,
		Clockwise = true
	},

	{	
		Index = 3,
		File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
		Frame_i = 1,
		Dir = "Out",
		Clockwise = false
	}

}

	BGA_G.ParTweak(params, tweaks)
	
return Def.ActorFrame{

	LoadActor("../Resources/Scripts/TileTool.lua", params[1])..{},
	LoadActor("../Resources/Scripts/SpaceEffects/Spiral.lua", params[2])..{
		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params[2])[2] * 8
			self:sleep(d):diffusealpha(0)
			self:sleep(d):diffusealpha(1)
			self:queuecommand("Repeat")
		end		
	},
	LoadActor("../Resources/Scripts/SpaceEffects/Spiral.lua", params[3])..{
		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')
			self:diffusealpha(0)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params[3])[2] * 8
			self:sleep(d):diffusealpha(1)
			self:sleep(d):diffusealpha(0)
			self:queuecommand("Repeat")
		end		
	}

}