local params = ...

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

	BGA_NoParams( params )

	t[#t+1] = LoadActor( "../TileTool.lua", params )..{}


for i = 0,12 do

	t[#t+1] = Def.ActorFrame{

		GainFocusCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_PlayAllCommands(self, params)
		end,

		Def.Sprite{
			GainFocusCommand=function(self)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:Center()
				self:Load( params.File )
				self:diffusealpha(0.75)
				BGA_FrameSelector(self, params)

				local mag = 2.5
				local val = ( i % 2 ) * mag * 2 - mag
				self:bob():effectperiod(1):effectmagnitude(0,val,0)

				self:fadeleft( 0.0125 * 2 )
				self:faderight( 0.0125 * 2 )

				self:cropleft( i * 0.087 )
				self:cropright( 1 - ( i + 1.2 ) * 0.087 )

			end

		}

	}

end

return Def.ActorFrame{ t }