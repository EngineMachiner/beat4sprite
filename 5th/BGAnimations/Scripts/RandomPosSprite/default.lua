local file, rainbow, rotation = ...

local ScaleVar = _screen.h/480

local ZoomValue = {
	
	0.5*ScaleVar,
	0.75*ScaleVar,
	1*ScaleVar,
	
}


local t = Def.ActorFrame{

	OnCommand=function(self) 
		self:playcommand("Repeat") 
	end

}

for i=1,12 do
	t[#t+1] = Def.Sprite{
		Texture = file, 
        RepeatCommand=function(self)

			if rainbow then 
				self:rainbow():effectoffset(i*0.1):effectperiod(8)
			end

			if rotation then 
				self:rotationz(math.random(0,360))
			end

		  	self:effectclock("beat"):set_tween_uses_effect_delta(true)
		 		:zoom(ZoomValue[math.random(1,3)])
		 		:x(math.random(0, _screen.w))
		 		:y(math.random(0, _screen.h))
		 		:sleep(2)
		 		:zoom(ZoomValue[math.random(1,3)])
		  		:x(math.random(0, _screen.w))
		  		:y(math.random(0, _screen.h))
		  		:queuecommand("Repeat")
		  		AnimationDelay(self)
				ToolPreview(self)

		  	if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end

		end	
	}
end	

return t