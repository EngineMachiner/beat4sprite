
local t = Def.ActorFrame{}

	local params = {

		{
			Index = 1,
			File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
			X_num = { -4, 3 },
			Y_num = { -2, 1 },
			Frame_i = 13,
			Cleanup = true
		},

		{
			Index = 2,
			Remove = true
		}

	}

	t[#t+1] = LoadActor("../5th001A",params)..{}

	params = {
		File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
		X_num = { -4, 3 },
		Y_num = { -2, 1 },
		BGMirror = true,
		Commands = { "LStates", "Mirror" },
		Frame_i = 7,
		Frame_l = 8
	}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{
		OnCommand=function(self)
			self:queuecommand("Repeat")
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2] * 4
			self:diffusealpha(0):sleep(d)
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep(d*2)
			self:queuecommand("Repeat")
		end
	}
	
	t[#t+1] = LoadActor("../5th041A")..{
		OnCommand=function(self)
			self:queuecommand("Repeat")
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2] * 8
			self:diffusealpha(0):sleep(d)
			self:diffusealpha(1):sleep(d)
			self:queuecommand("Repeat")
		end
	}

	params = {
		File = "/BGAnimations/Resources/5th/Sprites/X1 5x1.png",
		X_num = 5,
		Frame_i = 1,
		Frame_l = 5,
		Commands = { "StairsStates", "SpinX" }
	}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

return t