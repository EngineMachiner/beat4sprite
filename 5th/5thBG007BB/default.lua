
local t = Def.ActorFrame{}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", { 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Backgrounds/CA.png",
		BGMirror = true,
		X_num = 1,
		Commands = { "Mirror" }
	} )..{}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		BGMirror = true,
		X_num = 1,
		Commands = { "Mirror" }
	} )..{
		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true):effectclock('beat')
			PSX_BGA_Globals["BGA_ToolPreview"](self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(0):sleep(0.5)
				:diffusealpha(1):sleep(1.5)
				:diffusealpha(0):sleep(0.5)
				:diffusealpha(1):sleep(1.5)
			self:queuecommand("On")
		end
	}

return Def.ActorFrame{ t }