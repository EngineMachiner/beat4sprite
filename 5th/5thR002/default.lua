
local s = "/BGAnimations"
local scripts = {
	s .. "/5thR003B/default.lua",
	s .. "/5thR003C/default.lua",
	s .. "/5thR003D/default.lua",
	s .. "/5thR003E/default.lua"
}

local t = Def.ActorFrame{

	OnCommand=function(self)
		self:RunCommandsOnChildren( function(child) 
			child:visible(true)
		end )
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end

}

for i=#scripts,1,-1 do
	t[#t+1] = Def.ActorFrame{
		loadfile(scripts[i])(),
		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.ScreenPreview(self)		
			self:diffusealpha(1):sleep( ( i - 1 ) * 2 )
			self:diffusealpha(0):sleep( ( #scripts - 1 ) * 2 )
			self:queuecommand("Repeat")
		end,
		GoCommand=function(self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self)[2] * 2
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep( ( #scripts - 1 ) * d )
			self:queuecommand("Go")
		end
	}
end

return Def.ActorFrame{ t }