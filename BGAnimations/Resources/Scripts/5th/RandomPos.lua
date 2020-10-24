
local params = ...

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

	PSX_BGA_Globals["BGA_NoParams"]( params )

for i=1,24 do
	t[#t+1] = Def.Sprite{

        OnCommand=function(self)

        	self:Load( params.File )
		  	self:effectclock("beat")
		  	self:set_tween_uses_effect_delta(true)
		  	PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)
		  	PSX_BGA_Globals["BGA_FrameSelector"](self, params)
		  	self:queuecommand("Go")

		end,
		GoCommand=function(self)

		 	self:zoom( self:GetZoom() * 0.25 * math.random(1,3) )
		 		:x(math.random(0, _screen.w))
		 		:y(math.random(0, _screen.h))
		 		:sleep(2)
		  		:queuecommand("Go")

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