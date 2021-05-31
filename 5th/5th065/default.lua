
local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local replace = ...

local s = "/BGAnimations/Resources"
local params = {

	Index = 1,
	File = s .. "/5th/Backgrounds/C.png",
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true

}

	BGA_G.ParTweak( params, replace )

	t[#t+1] = loadfile( s .. "/Scripts/TileTool.lua" )( params )

params = {

	Index = 2,
	File = s .. "/5th/Backgrounds/CA.png",
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true

}

BGA_G.ParTweak( params, replace )

t[#t+1] = Def.ActorFrame{
	loadfile( s .. "/Scripts/TileTool.lua" )( params ),
	OnCommand=function(self)
		self.Beat = params.Beat or 1
		self.Beat = self.Beat * BGA_G.GetDelay(self, params)[2]
		self:effectclock("beat")
		self:set_tween_uses_effect_delta(true)
		BGA_G.ScreenPreview(self)
		self:queuecommand("Repeat")
	end,
	RepeatCommand=function(self)
		self:diffusealpha(0):sleep(self.Beat)
		self:diffusealpha(1):sleep(self.Beat)
		self:queuecommand("Repeat")
	end
}

return Def.ActorFrame{ t }