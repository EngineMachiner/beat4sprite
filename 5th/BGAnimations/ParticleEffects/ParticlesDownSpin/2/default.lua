local file, file2 = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{};

local SelectedAngle = {

	-360,
	360,

}

local ZoomValue = {
	
	0.75,
	1,
	
}

for i=1,8 do	

	if i == 1 or i == 3 or i == 5 or i == 7 then SelectedFile = file end
	if i == 2 or i == 4 or i == 6 or i == 8 then SelectedFile = file2 end

		t[#t+1] = Def.Sprite{
		Texture=SelectedFile,
			OnCommand=function(self)			
		
				local NoStates if self:GetNumStates() == 1 then 
					numStates = 0 else 
					numStates = math.random(0,self:GetNumStates()-1) 
					end;
					
				local numDelay = self:GetNumStates()
				local colorval = ZoomValue[math.random(1,2)]
			
			self:diffusealpha(0):sleep(i/8):diffusealpha(1)
			:zoom(colorval*ScaleVar):setstate(numStates):SetAllStateDelays((1/numDelay)/2)
			:diffuse(colorval,colorval,colorval,1)
			:x(math.random(self:GetWidth()/2,_screen.w-self:GetWidth()/2))
			:rotationz(0)
			:y(-self:GetHeight()/2)
			:linear(math.random(2.123456789,3.123456789)*1.25)
			:set_tween_uses_effect_delta(true):effectclock("beat")
			:rotationz(SelectedAngle[math.random(1,2)])
			:y(_screen.h+self:GetHeight()/2)
			:queuecommand("On")
			end;
		}
end

return t;