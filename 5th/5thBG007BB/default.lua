
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
			BGA_G.ScreenPreview(self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self)[2]
			self:diffusealpha(0):sleep(0.5*d)
				:diffusealpha(1):sleep(1.5*d)
				:diffusealpha(0):sleep(0.5*d)
				:diffusealpha(1):sleep(1.5*d)
			self:queuecommand("On")
		end
	}

return Def.ActorFrame{ t }