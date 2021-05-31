
local t = Def.ActorFrame{}

	t[#t+1] = loadfile( "/BGAnimations/5thBG000/default.lua" )( { 
		Index = 1,
		Actors = { BGA_G.IDest_Quad() }
	} )

	t[#t+1] = Def.ActorFrame{

		loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( {
			File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
			BGMirror = true,
			X_num = 1,
			Commands = { "Mirror" }
		} ),
		
		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true):effectclock('beat')
			BGA_G.ScreenPreview(self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self)[2] * 2
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep(d)
			self:queuecommand("Repeat")
		end
		
	}

return Def.ActorFrame{ t }