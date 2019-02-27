local ScaleVar = _screen.h/480
local file_1, file_2 = ...

local t = Def.ActorFrame{};

local Params = {
	NumParticles = 8,
	File = sprite,
}
	
local tParticleInfo = {}	

		local tween_duration = 1
		for i=1,Params.NumParticles do

	t[#t+1] = Def.Sprite{
	Texture=Params.File,
	Name="Particle"..i;
	
		OnCommand=function(self)		

		if i == 2 or i == 4 or i == 6 or i == 8 then self:Load(file_1) else self:Load(file_2) end

		local NoStates if self:GetNumStates() == 1 then numStates = 0 else numStates = math.random(0,self:GetNumStates()-1) end;

		self:zoom(1.5*ScaleVar):diffusealpha(0):sleep(i/6):diffusealpha(1)
		:xy((-SCREEN_WIDTH/((self:GetWidth()/1.75)/(self:GetWidth()/(14/i))))+SCREEN_WIDTH+self:GetWidth(),-self:GetHeight()/2)
		:linear(1)
		:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):rotationz(360)
		:set_tween_uses_effect_delta(true)
		:setstate(numStates):SetAllStateDelays(1/self:GetNumStates()):zoom(0):sleep(0.5)
		:playcommand("Phase2")

		end;
		
		Phase2Command=function(self)
			self:xy(-self:GetWidth()/1.75,SCREEN_HEIGHT/((self:GetHeight()/2)/(self:GetHeight()/(16/i)))):rotationz(0):zoom(1.5*ScaleVar)
				:linear(1)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):rotationz(360):zoom(0):sleep(0.5)
				:playcommand("Phase3")
		end;
				
		Phase3Command=function(self)
			self:xy(SCREEN_WIDTH/((self:GetWidth()/1.75)/(self:GetWidth()/(16/i))),SCREEN_HEIGHT+self:GetHeight()/2):rotationz(0):zoom(1.5*ScaleVar)
				:linear(1)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):rotationz(360):zoom(0):sleep(0.5)
				:playcommand("Phase4")
		end;		
		
		Phase4Command=function(self)
			self:xy(SCREEN_WIDTH+self:GetWidth()/1.75,(-SCREEN_HEIGHT/((self:GetHeight()/2)/(self:GetHeight()/(16/i)))+SCREEN_HEIGHT)):rotationz(0):zoom(1.5*ScaleVar)
				:linear(1)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):rotationz(360):zoom(0):sleep(0.5)
		end;		
		
					};
				end
return t;