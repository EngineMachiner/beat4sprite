
local tweaks = ...

local s = "/BGAnimations/Resources"
local params = {

	{
		Index = 1,
		File = s .. "/5th/Sprites/DA 4x3.png",
		Frame_i = 11,
		Frame_l = 12,
		X_num = { -5, 4 },
		Y_num = 1
	},

	{
		Index = 2,
		File = s .. "/5th/Sprites/DABC 4x4.png",
		Frame_i = 9,
		Clockwise = true
	},

	{	
		Index = 3,
		File = s .. "/5th/Sprites/DABC 4x4.png",
		Frame_i = 9,
		Dir = "Out",
		Clockwise = false
	}

}

	BGA_G.ParTweak(params, tweaks)
	
return Def.ActorFrame{

	loadfile( s .. "/Scripts/TileTool.lua" )( params[1] ),

	Def.ActorFrame{

		OnCommand=function(af)
			af:RunCommandsOnChildren(function(c)
				c:set_tween_uses_effect_delta(true)
				c:effectclock('beat')
			end)
			af:queuecommand("Repeat")
		end,
		
		Def.ActorFrame{
			loadfile( s .. "/Scripts/SpaceEffects/RoundTrace.lua" )( params[2]),
			RepeatCommand=function(self)
				local d = BGA_G.GetDelay(self, params)[2] * 8
				self:sleep(d):diffusealpha(0)
				self:sleep(d):diffusealpha(1)
				self:queuecommand("Repeat")
			end		
		},

		Def.ActorFrame{
			loadfile( s .. "/Scripts/SpaceEffects/RoundTrace.lua" )( params[3] ),
			OnCommand=function(self)
				self:diffusealpha(0)
			end,
			RepeatCommand=function(self)
				local d = BGA_G.GetDelay(self, params)[2] * 8
				self:sleep(d):diffusealpha(1)
				self:sleep(d):diffusealpha(0)
				self:queuecommand("Repeat")
			end		
		}

	}

}