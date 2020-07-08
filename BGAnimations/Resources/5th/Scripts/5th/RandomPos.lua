
local params = ...

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end

}

	BGA_NoParams( params )

for i=1,24 do
	t[#t+1] = Def.Sprite{

        GainFocusCommand=function(self)

        	self:Load( params.File )
		  	self:effectclock("beat")
		  	self:set_tween_uses_effect_delta(true)
		  	BGA_PlayAllCommands(self, params)
		  	BGA_FrameSelector(self, params)

		 	self:zoom( self:GetZoom() * 0.25 * math.random(1,3) )
		 		:x(math.random(0, _screen.w))
		 		:y(math.random(0, _screen.h))
		 		:sleep(2)
		  		:queuecommand("GainFocus")

		  	if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end

		end,
		RainbowCommand=function(self)
			self:rainbow():effectoffset(i*0.12):effectperiod(8)
		end,
		RotationCommand=function(self)
			self:rotationz(math.random(0,360))
		end

	}
end	

return t