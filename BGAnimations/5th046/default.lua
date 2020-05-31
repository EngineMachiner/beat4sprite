
local t = Def.ActorFrame{}

	local params = {

		{
			Index = 1,
			File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
			X_num = { -4, 3 },
			Y_num = { -2, 1 },
			Frame_i = 13,
			ResetParams = true
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
		Commands = { "OneTwoStates", "Mirror" },
		Frame_i = 7,
		Frame_l = 8
	}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{
		GainFocusCommand=function(self)
			self:queuecommand("GainFocus2")
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end,
		GainFocus2Command=function(self)
			self:diffusealpha(0):sleep(4)
				:diffusealpha(1):sleep(4)
				:diffusealpha(0):sleep(4*2)
				:queuecommand("GainFocus2")
		end
	}
	
	t[#t+1] = LoadActor("../5th041A")..{
		GainFocusCommand=function(self)
			self:queuecommand("GainFocus2")
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end,
		GainFocus2Command=function(self)
			self:diffusealpha(0):sleep(4*2)
				:diffusealpha(1):sleep(4*2)
				:queuecommand("GainFocus2")
		end
	}

	params = {
		File = "/BGAnimations/5th046/D 5x1.png",
		X_num = 5,
		Frame_i = 1,
		Frame_l = 5,
		Commands = { "StairsStates", "SpinX" }
	}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

return t