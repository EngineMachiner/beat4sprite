return Def.ActorFrame{

	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end,
	LoadActor( "/BGAnimations/5th034C" )..{
		OnCommand=function(self)
			self:rainbow()
			self:effectperiod(8)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end
	}

}