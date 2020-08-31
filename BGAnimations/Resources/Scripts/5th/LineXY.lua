local params  =  ...

local sprite = params.File
BGA_NoParams( params )

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end
}

for i=1,13 do 

	t[#t+1] = Def.Sprite{
		GainFocusCommand=function(self)

			self:Load(sprite)
			self:set_tween_uses_effect_delta(true)
			self:effectclock("beat")
			self:queuecommand("Repeat")
			BGA_FrameSelector(self, params)
			BGA_PlayAllCommands(self, params)

		end,
		TwoSpritesCommand=function(self)
			self:animate(false)
			self:setstate(i % self:GetNumStates())
		end,
		RepeatCommand=function(self)

			if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end

			local v = i % 2
			if v == 0 then 
				v = -1
			end

			self:diffusealpha(0)

			if i < 5 then
				self:sleep( math.random(i*100,(i+1)*100) * 0.01 ):diffusealpha(1)
				self:x( SCREEN_RIGHT - SCREEN_RIGHT * ( i % 2 ) - self:GetZoomedWidth() * v )
				self:y( SCREEN_TOP + self:GetZoomedHeight() * ( i - 1 ) )
				self:linear( SCREEN_WIDTH / self:GetZoomedWidth() )
				self:x( SCREEN_RIGHT - SCREEN_RIGHT * ( ( i + 1 ) % 2 ) + self:GetZoomedWidth() * v )
			else
				self:sleep( math.random((i-5)*100,((i-5)+1)*100) * 0.01 ):diffusealpha(1)
				self:y( SCREEN_BOTTOM - SCREEN_BOTTOM * ( i % 2 ) - self:GetZoomedHeight() * v )
				self:x( SCREEN_CENTER_X + self:GetZoomedWidth() * ( - i + 9 )  )
				self:linear( SCREEN_HEIGHT / self:GetZoomedHeight() )
				self:y( SCREEN_BOTTOM - SCREEN_BOTTOM * ( ( i + 1 ) % 2 ) + self:GetZoomedHeight() * v )
			end

			self:queuecommand("Repeat")

		end	
	}

end

return t
