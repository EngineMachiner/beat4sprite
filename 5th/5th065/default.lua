
local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

local replace = ...

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Backgrounds/C.png",
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

	t[#t+1] = LoadActor("../Resources/Scripts/TileTool.lua", params)..{}


	params = {

		Index = 2,
		File = "/BGAnimations/Resources/5th/Backgrounds/CA.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true,
		Beat = 1

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
			self:diffusealpha(0):sleep(params.Beat):diffusealpha(1):sleep(params.Beat)
				:queuecommand("On")
		end
	}


return Def.ActorFrame{ t }