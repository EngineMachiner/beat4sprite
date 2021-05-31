local t = Def.ActorFrame{}

local replace = ...

t[#t+1] = loadfile( "/BGAnimations/5thBG000/default.lua" )()

local s = "/BGAnimations/Resources"
local params = {

	Index = 1,
	File = s .. "/5th/Backgrounds/BABC 2x2.png",
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Frame_i = 2,
	Commands = "Mirror"

}

	BGA_G.ParTweak( params, replace )

	t[#t+1] = Def.ActorFrame{
		loadfile( s .. "/Scripts/TileTool.lua" )( params ),
		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.ScreenPreview(self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self)[2] * 2
			self:diffusealpha(0):sleep(d)
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep(2*d)
			self:queuecommand("Repeat")
		end
	}

	params = {

		Index = 2,
		File = s .. "/5th/Backgrounds/BABC 2x2.png",
		X_num = { -2, 1 },
		Y_num = { -1, 0 },
		Frame_i = 3,
		Commands = "Mirror"

	}

	BGA_G.ParTweak( params, replace )

	t[#t+1] = Def.ActorFrame{
		loadfile( s .. "/Scripts/TileTool.lua" )( params ),
		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.ScreenPreview(self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self)[2] * 2
			self:diffusealpha(0):sleep(2*d)
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep(d)
			self:queuecommand("Repeat")
		end
	}

return Def.ActorFrame{ t }