return Def.ActorFrame{

	Def.Quad{

		OnCommand=function(self)
			self:Center():visible(true)
			self:SetSize(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:diffuseramp()
			self:effectcolor1(color("#00ffff"))
			self:effectcolor2(color("#008b8b"))
			self:effectclock('beat')
			self:effectperiod(0.5)
			self:set_tween_uses_effect_delta(true)
		end,

		LoseFocusCommand=function(self)
			self:stopeffect():visible(false)
		end

	},

	LoadActor("../5th048A", { Index = 2, Remove = true } )..{}
	
}