local t = Def.ActorFrame{}

local replace = ...

	t[#t+1] = LoadActor("../5thBG000")..{}

local params = {

		Index = 1,
		File = "/BGAnimations/Resources/5th/Backgrounds/BABC 2x2.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_i = 2,
		Commands = "Mirror"

	}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

	t[#t+1] = LoadActor("../Resources/Scripts/TileTool.lua", params)..{
		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			PSX_BGA_Globals["BGA_ToolPreview"](self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(0):sleep(2)
				:diffusealpha(1):sleep(2)
				:diffusealpha(0):sleep(4)
				:queuecommand("On")
		end
	}

	params = {

		Index = 2,
		File = "/BGAnimations/Resources/5th/Backgrounds/BABC 2x2.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_i = 3,
		Commands = "Mirror"

	}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

	t[#t+1] = LoadActor("../Resources/Scripts/TileTool.lua", params)..{
		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			PSX_BGA_Globals["BGA_ToolPreview"](self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(0):sleep(4)
				:diffusealpha(1):sleep(2)
				:diffusealpha(0):sleep(2)
				:queuecommand("On")
		end
	}

return Def.ActorFrame{ t }