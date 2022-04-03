
local params = ...

local t = BGA_G.Frame()

for i=1,24 do
	t[#t+1] = Def.Sprite{

        OnCommand=function(self)

			self.UniqueEffect = true
        	self:Load( params.File )
			BGA_G.ObjFuncs(self)
		  	self:PlayCmds(params)
		  	self:SetStates(params)
		  	self:queuecommand("Go")

		end,
		GoCommand=function(self)

		 	self:zoom( self:GetZoom() * 0.25 * math.random(1,3) )
			self:x( math.random(0, _screen.w) )
			self:y( math.random(0, _screen.h) )
			self:sleep( 2 * self:GetDelay(2) )
			self:queuecommand("Go")

		  	if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end

		end,
		RainbowCommand=function(self)
			self:rainbow():effectoffset(i*0.12)
			self:effectperiod( 16 * self:GetDelay(2) )
		end,
		RotationCommand=function(self)
			self:rotationz(math.random(0,360))
		end

	}
end	

t = not params.Remove and t

return Def.ActorFrame{ t }