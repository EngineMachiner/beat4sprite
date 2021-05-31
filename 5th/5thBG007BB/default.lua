
local s = "/BGAnimations/Resources"
local t = Def.ActorFrame{}

t[#t+1] = loadfile( s .. "/Scripts/TileTool.lua" )( { 
	Index = 1,
	File = s .. "/5th/Backgrounds/CA.png",
	BGMirror = true,
	X_num = 1,
	Commands = { "Mirror" }
} )..{}

t[#t+1] = Def.ActorFrame{
	
	loadfile( s .. "/Scripts/TileTool.lua" )( {
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
		local d = BGA_G.GetDelay(self)[2]
		self:diffusealpha(0):sleep(0.5*d)
			:diffusealpha(1):sleep(1.5*d)
			:diffusealpha(0):sleep(0.5*d)
			:diffusealpha(1):sleep(1.5*d)
		self:queuecommand("Repeat")
	end

}

return Def.ActorFrame{ t }