local ScaleVar = _screen.h/480
local params = ...

BGA_NoParams( params )

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self:fov(130):zbuffer(true)
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

local num = 8 + 4

for i=1,num do	
	local bounce_h = 0
	t[#t+1] = Def.ActorFrame{
		GainFocusCommand=function(self)
			self:diffusealpha(0)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			self:sleep(i*0.5)
			self:queuecommand("Repeat")
			self:queuecommand("StartBump")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(1)
			self:z(-500):linear(num*0.5):z(50)
				:linear(0.25):diffusealpha(0)
				:queuecommand("Repeat")
				:queuecommand("StartBump")
		end,
		Def.Sprite{
			Texture=params.File,
			Name="Particle "..i,
			GainFocusCommand=function(self)
				self:zoom(ScaleVar)
				self:effectclock("beat")
				self:set_tween_uses_effect_delta(true)
				self:diffusealpha(0)
				self:queuecommand("StartBump")
				BGA_FrameSelector(self, params)
				BGA_PlayAllCommands(self, params)
			end,
			StartBumpCommand=function(self)
				self:y(SCREEN_HEIGHT-self:GetHeight()):diffusealpha(1)
				self:x(math.random(self:GetZoomedWidth()*0.5-SCREEN_WIDTH*0.5,SCREEN_WIDTH-self:GetZoomedWidth()*0.5+SCREEN_WIDTH*0.5))
				self:bounce()
					:effectmagnitude(0,-self:GetZoomedHeight()*1.5,0)
					:effectoffset( math.random(0,1000) * 0.001 )
					:effectperiod( 1 )
			end,
		}
	}
end

return Def.ActorFrame{ t }