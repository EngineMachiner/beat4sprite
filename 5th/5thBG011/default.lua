
local t = Def.ActorFrame{}

	t[#t+1] = LoadActor( "../5thBG000", { 
		Index = 1,
		AddActors = { PSX_BGA_Globals["BGA_IQB"]() }
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
			self:diffusealpha(1):sleep(4):diffusealpha(0):sleep(4)
			self:queuecommand("On")
		end
	}

return Def.ActorFrame{ t }