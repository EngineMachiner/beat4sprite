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


for i = 0,9 do

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

				local mag = 2.5 * 0.5
				local val = ( i % 2 ) * mag * 2 - mag
				self:bob():effectperiod(1):effectmagnitude(val,0,0)

				self:fadetop( 0.0125 )
				self:fadebottom( 0.0125 )

				self:croptop( i * 0.1 )
				self:cropbottom( 1 - ( i + 1.2 ) * 0.1 )

			end

		}

	}

end

return Def.ActorFrame{ t }