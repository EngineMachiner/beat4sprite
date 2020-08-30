return Def.ActorFrame{

	LoadActor("/BGAnimations/5th016A",params)..{},
	LoadActor("/BGAnimations/5th012A",params)..{
		GainFocusCommand=function(self)
			self:diffusealpha(0):sleep(1)
			self:diffusealpha(1):sleep(1)
			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')
			self:queuecommand("GainFocus")
		end,
	}

}