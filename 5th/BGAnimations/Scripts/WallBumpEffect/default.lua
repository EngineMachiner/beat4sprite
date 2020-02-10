local sprite = ...

local ScaleVar = _screen.h/480

local num = 10

local InitPos_2 = {

	SCREEN_RIGHT,
	SCREEN_LEFT,
	0,
	SCREEN_TOP,
	SCREEN_BOTTOM,

}	

local t = Def.ActorFrame{}	

local count = 1

for i=1,num do
	
	t[#t+1] = Def.Sprite{

		Name="Particle "..i,
	
		OnCommand=function(self)		
		
			if type(sprite) == "table" then
				if count > #sprite then
					count = 1
				end
				self:Load(sprite[count])
				count = count + 1
			else
				self:Load(sprite)
			end

			if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end
		
			self:zoom(ScaleVar)
			:diffusealpha(0):sleep(i/num):diffusealpha(1)
			:xy(math.random(SCREEN_LEFT+(self:GetWidth()*ScaleVar/2),SCREEN_RIGHT-(self:GetWidth()*ScaleVar/2)),math.random(SCREEN_TOP+(self:GetHeight()*ScaleVar/2),SCREEN_BOTTOM-(self:GetHeight()*ScaleVar/2)))
			:linear(1.5)
			:xy(InitPos_2[math.random(1,3)],InitPos_2[math.random(3,5)])
			:effectclock("beat")
			:set_tween_uses_effect_delta(true)
			AnimationDelay(self)
			ToolPreview(self)
		
		end
				
	}

end
		
local function UpdateParticles(self)
	
	local InitPos = {

		math.random(SCREEN_RIGHT+self:GetWidth()*ScaleVar,2*SCREEN_RIGHT+self:GetWidth()*ScaleVar),
		math.random(-SCREEN_RIGHT-self:GetWidth()*ScaleVar,SCREEN_LEFT-self:GetWidth()*ScaleVar),
		math.random(-SCREEN_BOTTOM-self:GetHeight()*ScaleVar,SCREEN_TOP-self:GetHeight()*ScaleVar),
		math.random(SCREEN_BOTTOM+self:GetHeight()*ScaleVar,2*SCREEN_BOTTOM+self:GetHeight()*ScaleVar),

	}		

	for i=1,num do
	
		local p = self:GetChildren()["Particle "..i]
	
		local s = {
	
			p:GetWidth()*ScaleVar/2,
			p:GetHeight()*ScaleVar/2,
	
		}
	
--DownLeftY

		if p:GetX() <= (SCREEN_LEFT+(s[1]))
		and p:GetY() > SCREEN_CENTER_Y
		and p:GetY() < SCREEN_BOTTOM then

			p:xy( p:GetX() , p:GetY())
			p:finishtweening()
			p:linear(1.5)
			:x(math.random( (SCREEN_RIGHT/2) , (3*SCREEN_RIGHT)/4 ) )
			:y( SCREEN_TOP )
				
		end		
	
--DownLeftX	

		if p:GetX() < SCREEN_CENTER_X 
		and p:GetX() > SCREEN_LEFT  + (p:GetWidth()*ScaleVar/2) 
		and p:GetY() >= (SCREEN_BOTTOM-(s[2])) then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1)
			:y(math.random( (SCREEN_BOTTOM)/2 , (SCREEN_BOTTOM*3)/4 ))
			:x( SCREEN_LEFT )
				
		end
	
--Up1/4X

		if p:GetX() < SCREEN_CENTER_X 
		and p:GetX() > (SCREEN_RIGHT)/4
		and p:GetY() <= (SCREEN_TOP+(s[2]))	then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:x(math.random( (SCREEN_RIGHT/2) , (3*SCREEN_RIGHT)/4 ) )
			:y( SCREEN_BOTTOM )
				
		end		
	
--UpLeftY

		if p:GetX() <= (SCREEN_LEFT+(s[1]))
		and p:GetY() < SCREEN_CENTER_Y
		and p:GetY() > SCREEN_TOP then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1)
			:x(math.random( (SCREEN_RIGHT/4) , (SCREEN_RIGHT/2) ) )
			:y( SCREEN_TOP )
				
		end
			
--Down1/4X	

		if p:GetX() < SCREEN_CENTER_X 
		and p:GetX() > (SCREEN_RIGHT)/4
		and p:GetY() >= (SCREEN_BOTTOM-(s[2])) then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:y( math.random( (SCREEN_BOTTOM/4) , (SCREEN_BOTTOM/2) ) )
			:x( SCREEN_LEFT )
				
		end
	
--Up3/4X	

		if p:GetX() > SCREEN_CENTER_X 
		and p:GetX() < (3*SCREEN_RIGHT)/4
		and p:GetY() <= (SCREEN_TOP+(s[2])) then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:x(math.random( (SCREEN_BOTTOM/4) , (SCREEN_BOTTOM/2) ) )
			:y( SCREEN_BOTTOM )
				
		end
		
--Down3/4X

		if p:GetX() > SCREEN_CENTER_X 
		and p:GetX() < (3*SCREEN_RIGHT)/4
		and p:GetY() >= (SCREEN_BOTTOM-(s[2])) then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:y( math.random( (SCREEN_BOTTOM)/2 , SCREEN_BOTTOM ) )
			:x( SCREEN_RIGHT )
			
		end
		
--DownRightY

		if p:GetY() > SCREEN_CENTER_Y
		and p:GetX() >= (SCREEN_RIGHT-(s[1]))
		and p:GetY() < SCREEN_BOTTOM then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:x( math.random( (SCREEN_RIGHT)/2 , (3*SCREEN_RIGHT)/4 ) )
			:y( SCREEN_TOP )
				
		end
		
	--END
	
--DownRightX

		if p:GetX() > SCREEN_CENTER_X 
		and p:GetX() < SCREEN_RIGHT 
		and p:GetY() >= (SCREEN_BOTTOM-(s[2])) then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1)
			:y(math.random((SCREEN_BOTTOM)/2 , (SCREEN_BOTTOM*3)/4 ))
			:x( SCREEN_RIGHT )
				
		end	
		
--UpRightX	

		if p:GetX() > SCREEN_CENTER_X 
		and p:GetX() < SCREEN_RIGHT - (p:GetWidth()*ScaleVar/2)
		and p:GetY() <= (SCREEN_TOP+(s[2])) then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:y( SCREEN_BOTTOM )
			:x(math.random( SCREEN_RIGHT/4 , (3*SCREEN_RIGHT)/4 ))
				
		end
		
--UpRightY

		if p:GetY() < SCREEN_CENTER_Y 
		and p:GetX() >= (SCREEN_RIGHT-(s[1]))
		and p:GetY() > SCREEN_TOP then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:y( SCREEN_TOP )
			:x(math.random( (SCREEN_RIGHT)/2 , (3*SCREEN_RIGHT)/4 ) )
				
		end
		
--UpLeftX	

		if p:GetX() < SCREEN_CENTER_X 
		and p:GetX() > SCREEN_LEFT
		and p:GetY() <= (SCREEN_TOP+(s[2])) then

			p:xy( p:GetX() , p:GetY() )
			p:finishtweening()
			p:linear(1.5)
			:y( SCREEN_BOTTOM )
			:x(math.random( (SCREEN_RIGHT)/4 , (3*SCREEN_RIGHT)/4 ) )
		
		end		
		
--Repeat

		if p:GetY() <= SCREEN_TOP 
		or p:GetY() >= SCREEN_BOTTOM 
		or p:GetX() <= SCREEN_LEFT 
		or p:GetY() >= SCREEN_RIGHT then
			p:xy(math.random(SCREEN_LEFT+(self:GetWidth()*ScaleVar/2),SCREEN_RIGHT-(self:GetWidth()*ScaleVar/2)),math.random(SCREEN_TOP+(self:GetHeight()*ScaleVar/2),SCREEN_BOTTOM-(self:GetHeight()*ScaleVar/2)))
			p:linear(1)
			p:xy(InitPos_2[math.random(1,3)],InitPos_2[math.random(3,5)])
		end

	end

end
		
t.OnCommand = function(self) 
	self:SetUpdateFunction(UpdateParticles) 
end
		
return t