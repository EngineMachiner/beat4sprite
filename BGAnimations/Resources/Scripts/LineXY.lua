
local params = ...
params.Angle = params.Angle or 0

local t = BGA_G.Frame()

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:Center()
		self:rotationz( params.Angle )
	end
}
local a = t[#t]

a[#a+1] = Def.ActorFrame{
	OnCommand=function(self)
		local scale = math.rad( params.Angle )
		scale = 1 + math.abs( math.sin( scale ) )
		self:x( - SCREEN_CENTER_X * scale )
		self:y( - SCREEN_CENTER_Y * scale )
		self:zoom( scale )
	end
}
a = a[#a]

for i=1,13 do 

	a[#a+1] = Def.ActorFrame{}
	a = a[#a]

	a[#a+1] = Def.Sprite{

		Texture = params.File,

		OnCommand=function(self)
			BGA_G.ObjFuncs(self)
			self:SetStates(params)
			self:PlayCmds(params)
			self:queuecommand("Repeat")
		end,

		TwoSpritesCommand=function(self)
			local n = self:GetNumStates()
			self:animate(false)
			self:setstate(i % n)
			self.NoRandom = true
		end,

		RepeatCommand=function(self)

			local d = self:GetDelay()
			local n = self:GetNumStates()

			if n > 1 and not self.NoRandom then 
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

			self:hurrytweening( params.HurryTweenBy )
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

			self:queuecommand("Repeat")

		end	
	}

end

t = not params.Remove and t

return Def.ActorFrame{ t }