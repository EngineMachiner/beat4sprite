local params = ...

local count = 0

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

for i = 1,18 do
	t[#t+1] = Def.ActorFrame{

		GainFocusCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_PlayAllCommands(self, params)
		end,

		Def.Sprite{
			GainFocusCommand=function(self)

				self:Load( params.File )
				self:Center()
				BGA_FrameSelector(self, params)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)

				self:blend("BlendMode_Normal")

				self:fadeleft( 0.05 )
				self:faderight( 0.05 )
				self:fadetop( 0.05 )
				self:fadebottom( 0.05 )

				self:wag()
					:effectperiod(2)
					:effectmagnitude( 8 + 4 * ( i - 1 ), 4 + 2 * ( i - 1 ), 2 + 2 * ( i - 1 ) )

				if i > 2 then
					local crop_val = 0.03125 * i
					self:croptop(crop_val)
					self:cropbottom(crop_val)
					self:cropleft(crop_val)
					self:cropright(crop_val)
				end

			end
		},

		RainbowCommand=function(self)
			self:rainbow():effectperiod(8)
		end

	}
end

return t