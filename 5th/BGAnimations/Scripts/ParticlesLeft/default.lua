
local ScaleVar = _screen.h/480

local sprites, spin = ...

local t = Def.ActorFrame{
	OnCommand=function(self)	
		self:fov(120):zbuffer(true)
	end
}

local num_sprites = 9*2


local SelectedAngle = {

	-360,
	360,

}

if not spin then 
	SelectedAngle[1] = 0
	SelectedAngle[2] = 0
end


for i=1,num_sprites do	

		t[#t+1] = Def.Sprite{
			OnCommand=function(self)			

				if type(sprites) == "table" then 
					self:Load(sprites[math.random(1,#sprites)])
				else
					self:Load(sprites)
				end
				
				if self:GetNumStates() > 1 then 
					self:setstate(math.random(0,self:GetNumStates()-1))
				else
					self:setstate(0)
				end					

				local z_value = math.random(-500,0)*ScaleVar
				local col = tostring(1+z_value*0.001*1.25)

				local z_value_2 = z_value * ScaleVar * 1.65

				self:diffusealpha(0):sleep(i*0.5):diffusealpha(1)
					:z(z_value*ScaleVar)
					:zoom(ScaleVar)
					--:diffuse(color(col..","..col..","..col..",".."255"))
					:y(math.random(self:GetHeight()*0.5+z_value_2,_screen.h-self:GetHeight()*0.5-z_value_2))
					:x(SCREEN_RIGHT-z_value_2+self:GetWidth()/2)
					:rotationz(0)
					:linear(math.random(400,700)*0.01)
					:rotationz(SelectedAngle[math.random(1,2)])
					:x(SCREEN_LEFT+z_value_2-self:GetWidth()*0.5)
					:queuecommand("Repeat")
				self:set_tween_uses_effect_delta(true):effectclock("beat")
					AnimationDelay(self)
					ToolPreview(self)

			end,

			RepeatCommand=function(self)

				if type(sprites) == "table" then 
					self:Load(sprites[math.random(1,#sprites)])
				else
					self:Load(sprites)
				end
				
				if self:GetNumStates() > 1 then 
					self:setstate(math.random(0,self:GetNumStates()-1))
				else
					self:setstate(0)
				end	

				local z_value = math.random(-500,0)*ScaleVar
				local col = tostring(1+z_value*0.001*1.25)

				local z_value_2 = z_value * ScaleVar * 1.65

				self:diffusealpha(0):sleep(2):diffusealpha(1)
					:z(z_value*ScaleVar)
					--:diffuse(color(col..","..col..","..col..",".."255"))
					:y(math.random(self:GetHeight()*0.5+z_value_2,_screen.h-self:GetHeight()*0.5-z_value_2))
					:x(SCREEN_RIGHT-z_value_2+self:GetWidth()*0.5)
					:rotationz(0)
					:linear(math.random(400,700)*0.01)
					:rotationz(SelectedAngle[math.random(1,2)])
					:x(SCREEN_LEFT+z_value_2-self:GetWidth()*0.5)
					:queuecommand("Repeat")
					AnimationDelay(self)
			end

		}

end

return t