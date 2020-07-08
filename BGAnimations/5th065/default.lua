
local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(true)
		end )
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
		end )
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

	BGA_ParamsTweaks( params, replace )

	t[#t+1] = LoadActor("../Resources/5th/Scripts/TileTool.lua", params)..{}


	params = {

		Index = 2,
		File = "/BGAnimations/Resources/5th/Backgrounds/CA.png",
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true,
		Beat = 1

	}

	BGA_ParamsTweaks( params, replace )

	t[#t+1] = LoadActor("../Resources/5th/Scripts/TileTool.lua", params)..{
		GainFocusCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_ToolPreview(self)
			self:playcommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(0):sleep(params.Beat):diffusealpha(1):sleep(params.Beat)
				:queuecommand("GainFocus")
		end
	}


return Def.ActorFrame{ t }