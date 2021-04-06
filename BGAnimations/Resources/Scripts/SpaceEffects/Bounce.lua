
local scl = _screen.h/480
local params = ...

BGA_G.DefPar( params )

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:fov(130):zbuffer(true)
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end	
}

local num = 8 + 4

for i=1,num do	
	local bounce_h = 0
	t[#t+1] = Def.ActorFrame{
		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			self:diffusealpha(0)
			self:sleep(i*0.5)
			self:queuecommand("Repeat")
			self:queuecommand("StartBump")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(1)
			self:z(-500):linear(num*0.5):z(50)
			self:linear(0.25):diffusealpha(0)
			self:queuecommand("Repeat")
			self:queuecommand("StartBump")
		end,
		Def.Sprite{
			Texture=params.File,
			OnCommand=function(self)
				self:zoom(scl)
				self:effectclock("beat")
				self:set_tween_uses_effect_delta(true)
				self:diffusealpha(0)
				self:queuecommand("StartBump")
				BGA_G.SetStates(self, params)
				BGA_G.PlayCmds(self, params)
			end,
			StartBumpCommand=function(self)
				local w = self:GetZoomedWidth() * 0.5
				local h = self:GetZoomedHeight()
				local a = { 
					w - SCREEN_WIDTH * 0.5,
					SCREEN_WIDTH - w + SCREEN_WIDTH * 0.5
				}
				self:y(SCREEN_HEIGHT-h):diffusealpha(1)
				self:x( math.random( a[1], a[2] ) )
				self:bounce()
				self:effectmagnitude(0,-h*1.5,0)
				self:effectoffset( math.random(0,1000) * 0.001 )
				self:effectperiod( BGA_G.GetDelay(self)[2] )
			end,
		}
	}
end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }