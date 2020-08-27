
local ScaleVar = _screen.h/480
local params = ...
local sprites = params.File

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self:fov(120):zbuffer(true)
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end
	
}

if not params.Alpha then 
	params.Alpha = 1
end

BGA_NoParams( params )

local num = 9*2

local SelectedAngle = {

	-360,
	360

}

if not params.Spin then 
	SelectedAngle[1] = 0
	SelectedAngle[2] = 0
end

local smartcommand

if params.Dir == "Left" 
or params.Dir == "Right" then
	smartcommand = "MoveX"
else
	smartcommand = "MoveY"
end

if not params.Dir then params.Dir = "Down" end

for i=1,num do	

		t[#t+1] = Def.Sprite{

			GainFocusCommand=function(self)			

				if type(sprites) == "table" then 
					self:Load(sprites[math.random(1,#sprites)])
				else
					self:Load(sprites)
				end
				self:set_tween_uses_effect_delta(true):effectclock("beat")

				BGA_FrameSelector(self, params)
				BGA_PlayAllCommands(self, params)

				self:diffusealpha(0):sleep(i*0.5):diffusealpha(1):queuecommand(smartcommand)
				if self:GetNumStates() > 1 then
					self:setstate(math.random(0,self:GetNumStates()-1))
				end

			end,
			TwoSpritesCommand=function(self)
				self:animate(false)
				self:setstate(i % self:GetNumStates())
			end,
			SleepCommand=function(self)
				self:diffusealpha(0):sleep(2):diffusealpha(1):queuecommand(smartcommand)
			end,
			MoveXCommand=function(self)

				local z_value = math.random(-500,0)*ScaleVar
				local col = tostring(1+z_value*0.001*1.25)

				self:z(z_value*ScaleVar):rotationz(0)
				local z_distance = math.abs(self:GetZ())*ScaleVar*2

				local Dirs = {

					Right = { SCREEN_LEFT-self:GetZoomedWidth()*0.5-z_distance, SCREEN_RIGHT+self:GetZoomedWidth()*0.5+z_distance },
					Left = { SCREEN_RIGHT+self:GetZoomedWidth()*0.5+z_distance, SCREEN_LEFT-self:GetZoomedWidth()*0.5-z_distance }

				}

				if params.Shade then 
					self:diffuse(color(col..","..col..","..col..",".."1"))
				end		

				self:y(math.random(self:GetZoomedHeight()*0.5-z_distance*0.5,_screen.h-self:GetZoomedHeight()*0.5+z_distance*0.5))
					:x(Dirs[params.Dir][1])
					:linear(math.random(400,700)*0.01*0.5)
					:rotationz(SelectedAngle[math.random(1,2)])
					:x(Dirs[params.Dir][2])
					:queuecommand("Sleep")

			end,

			MoveYCommand=function(self)

				local z_value = math.random(-500,0)*ScaleVar
				local col = tostring(1+z_value*0.001*1.25*0.75)

				self:z(z_value*ScaleVar):rotationz(0)
				local z_distance = math.abs(self:GetZ())*ScaleVar

				local Dirs = {

					Up = { SCREEN_BOTTOM+self:GetZoomedHeight()*0.5+z_distance*1.25, SCREEN_TOP-self:GetZoomedHeight()*0.5-z_distance*1.25 },
					Down = { SCREEN_TOP-self:GetZoomedHeight()*0.5-z_distance*1.25, SCREEN_BOTTOM+self:GetZoomedHeight()*0.5+z_distance*1.25 }

				}

				if params.Shade then 
					self:diffuse(color(col..","..col..","..col..",".."1"))
				end
	
				self:x(math.random(self:GetHeight()*0.5-z_distance*2,_screen.h-self:GetHeight()*0.5+z_distance*2))
					:y(Dirs[params.Dir][1])
					:rotationz(0)
					:linear(math.random(400,700)*0.01*0.5)
					:rotationz(SelectedAngle[math.random(1,2)])
					:y(Dirs[params.Dir][2])
					:queuecommand("Sleep")

			end

		}

end

return t