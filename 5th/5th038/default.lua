
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frames = { 16, 16 },
	X_num = 4,
	Y_num = { -2, 1 }
}

local function Beat(self)
	self:set_tween_uses_effect_delta(true)
	self:effectclock('beat')
end

return Def.ActorFrame{

	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end,

	LoadActor("/BGAnimations/5th037B")..{},

	LoadActor("/BGAnimations/5th012A")..{
		OnCommand=function(self)
			Beat(self)
			self:GetParent():queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2]
			self:diffusealpha(0):sleep(d)
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep( 2 * d )
			self:queuecommand("Repeat")
		end,
	},

	LoadActor("/BGAnimations/5th016A")..{
		OnCommand=function(self)
			Beat(self)
			self:GetParent():queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2]
			self:diffusealpha(0):sleep(2*d)
			self:diffusealpha(1):sleep(d)
			self:diffusealpha(0):sleep(d)
			self:queuecommand("Repeat")
		end,
	},

	LoadActor("../Resources/Scripts/TileTool.lua", params)..{
		OnCommand=function(self)
			Beat(self)
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self, params)[2]
			self:diffusealpha(0):sleep(3*d)
			self:diffusealpha(1):sleep(d)
			self:queuecommand("Repeat")
		end,
	}

}