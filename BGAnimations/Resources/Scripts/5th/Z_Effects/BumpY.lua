local ScaleVar = _screen.h/480
local params = ...

PSX_BGA_Globals["BGA_NoParams"]( params )

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:fov(130):zbuffer(true)
	end,
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end	
}

local num = 8 + 4

for i=1,num do	
	local bounce_h = 0
	t[#t+1] = Def.ActorFrame{
		OnCommand=function(self)
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
			OnCommand=function(self)
				self:zoom(ScaleVar)
				self:effectclock("beat")
				self:set_tween_uses_effect_delta(true)
				self:diffusealpha(0)
				self:queuecommand("StartBump")
				PSX_BGA_Globals["BGA_FrameSelector"](self, params)
				PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)
			end,
			StartBumpCommand=function(self)
				self:y(SCREEN_HEIGHT-self:GetZoomedHeight()):diffusealpha(1)
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
