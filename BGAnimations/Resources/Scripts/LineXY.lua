
local params = ...

BGA_G.DefPar( params )

local t = Def.ActorFrame{}

for i=1,13 do 

	t[#t+1] = Def.ActorFrame{
		GainFocusCommand=function(self)
			BGA_G.Stop( self, true )
		end,
		LoseFocusCommand=function(self)
			BGA_G.Stop( self )
		end
	}

	local a = t[#t]

	a[#a+1] = Def.Sprite{

		InitCommand=function(self)
			self:Load(params.File)
		end,

		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true)
			self:effectclock("beat")
			BGA_G.SetStates(self, params)
			BGA_G.PlayCmds(self, params)
			self:queuecommand("Repeat")
		end,

		TwoSpritesCommand=function(self)
			local n = self:GetNumStates()
			self:animate(false)
			self:setstate(i % n)
			self.NoRandom = true
		end,

		RepeatCommand=function(self)

			local d = BGA_G.GetDelay(self)[2]
			local n = self:GetNumStates()

			if n > 1
			and not self.NoRandom then 
				n = math.random( 0, ( n - 1 ) )
				self:setstate( n )
			end

			local v = i % 2
			v = v == 0 and -1 or v

			self:diffusealpha(0)

			local w = self:GetZoomedWidth()
			local h = self:GetZoomedHeight()

			local s = math.random( i * 100, ( i + 1 ) * 100 )
			s = s * 0.01 * d

			local a = ( i % 2 )
			local b = ( ( i + 1 ) % 2 )

			self:sleep(s):diffusealpha(1)
			if i < 5 then
				self:x( SCREEN_RIGHT - SCREEN_RIGHT * a - w * v )
				self:y( SCREEN_TOP + h * ( i - 1 ) )
				self:linear( SCREEN_WIDTH * d / w )
				self:x( SCREEN_RIGHT - SCREEN_RIGHT * b + w * v )
			else
				self:y( SCREEN_BOTTOM - SCREEN_BOTTOM * a - h * v )
				self:x( SCREEN_CENTER_X + w * ( - i + 9 )  )
				self:linear( SCREEN_HEIGHT * d / h )
				self:y( SCREEN_BOTTOM - SCREEN_BOTTOM * b + h * v )
			end

			self:hurrytweening( params.HurryTweenBy )
			self:queuecommand("Repeat")

		end	
	}

end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }