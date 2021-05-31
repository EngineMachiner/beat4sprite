
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frames = { 16, 16 },
	X_num = 4,
	Y_num = { -2, 1 }
}

return Def.ActorFrame{

	OnCommand=function(af)
		af:RunCommandsOnChildren(function(c)
			c:set_tween_uses_effect_delta(true)
			c:effectclock('beat')
		end)
		af:queuecommand("Repeat")
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end,

	loadfile("/BGAnimations/5th037B/default.lua")(),

	Def.ActorFrame{
		loadfile("/BGAnimations/5th012A/default.lua")(),
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2]
			self:diffusealpha(0):sleep(d)
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep( 2 * d )
			self:queuecommand("Repeat")
		end
	},

	Def.ActorFrame{
		loadfile("/BGAnimations/5th016A/default.lua")(),
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2]
			self:diffusealpha(0):sleep(2*d)
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep(d)
			self:queuecommand("Repeat")
		end
	},

	Def.ActorFrame{
		loadfile("/BGAnimations/Resources/Scripts/TileTool.lua" )( params ),
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2]
			self:diffusealpha(0):sleep(3*d)
			self:diffusealpha(1):sleep(d)
			self:queuecommand("Repeat")
		end
	}

}