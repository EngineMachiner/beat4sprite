local ScaleVar = _screen.h/480
local file = "/BGAnimations/Sprites/5th/" .. (...)

local t = Def.ActorFrame{

		OnCommand=function(self) 
			self:playcommand("Repeat") 
		end,
	
}

local Params = {
	NumParticles = 20,
	File = file,
}
	
for i=1,Params.NumParticles do	
	
	t[#t+1] = Def.Sprite{
	Texture=Params.File,
	Name="Particle"..i,
	
			RepeatCommand=function(self)
			
				self:hibernate(i*4/Params.NumParticles)
					:zoom(0)
					:diffusealpha(1)
					:x(math.random(SCREEN_LEFT+(self:GetWidth()*ScaleVar/2),SCREEN_RIGHT-(self:GetWidth()*ScaleVar/2)))
					:y(_screen.h-(self:GetHeight()*ScaleVar))
					:bounce():effectmagnitude(0,math.random(-(self:GetHeight()*ScaleVar-self:GetHeight()*ScaleVar/math.random(3,4)),(-(self:GetHeight()*ScaleVar-self:GetHeight()*ScaleVar/2)))*2,0):effectoffset(i*4/Params.NumParticles):effectperiod(1)
					:linear(1)
					:x( self:GetX() + math.random(-self:GetWidth()*ScaleVar,self:GetWidth()*ScaleVar) )
					:y(_screen.h-(self:GetHeight()*ScaleVar/2))
					:zoom(0.875)
					:linear(1)
					:y(_screen.h+(self:GetHeight()*ScaleVar/2))
					:sleep(0.25*0.5)
					:linear(0.25)
					:y(self:GetY()+SCREEN_CENTER_Y/2)
					:diffusealpha(0)
					:zoom(0.875*2)
					:effectclock("beat")
					:queuecommand("Repeat")
					AnimationDelay(self)

				if self:GetNumStates() > 1 then 
					self:setstate(math.random(0,self:GetNumStates()))
				end
				
			end
	}
	
end

return t