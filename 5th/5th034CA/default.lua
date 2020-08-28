return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end,
	LoadActor( "/BGAnimations/5th034C", params )..{
		GainFocusCommand=function(self)
			self:rainbow()
			self:effectperiod(8)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
		end
	},

}