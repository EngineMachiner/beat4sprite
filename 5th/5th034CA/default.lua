return Def.ActorFrame{

	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end,
	Def.ActorFrame{
		loadfile( "/BGAnimations/5th034C/default.lua" )(),
		OnCommand=function(self)
			self:rainbow()
			self:effectperiod(8)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end
	}

}