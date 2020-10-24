return Def.ActorFrame{

	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end,
	LoadActor( "/BGAnimations/5th034C", params )..{
		OnCommand=function(self)
			self:rainbow()
			self:effectperiod(8)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end
	}

}