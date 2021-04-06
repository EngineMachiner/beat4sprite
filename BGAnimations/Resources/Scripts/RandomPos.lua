
local params = ...

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

	BGA_G.DefPar( params )

for i=1,24 do
	t[#t+1] = Def.Sprite{

        OnCommand=function(self)

			self.UniqueEffect = true
        	self:Load( params.File )
		  	self:effectclock("beat")
		  	self:set_tween_uses_effect_delta(true)
		  	BGA_G.PlayCmds(self, params)
		  	BGA_G.SetStates(self, params)
		  	self:queuecommand("Go")

		end,
		GoCommand=function(self)

			self:stoptweening()
		 	self:zoom( self:GetZoom() * 0.25 * math.random(1,3) )
			self:x(math.random(0, _screen.w))
			self:y(math.random(0, _screen.h))
			self:sleep(2 * BGA_G.GetDelay(self)[2])
			self:queuecommand("Go")

		  	if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end

		end,
		RainbowCommand=function(self)
			self:rainbow():effectoffset(i*0.12)
			self:effectperiod( 16 * BGA_G.GetDelay(self)[2] )
		end,
		RotationCommand=function(self)
			self:rotationz(math.random(0,360))
		end

	}
end	

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }