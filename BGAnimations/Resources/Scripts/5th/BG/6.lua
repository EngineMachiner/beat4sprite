
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

	t[#t+1] = LoadActor( "../../TileTool.lua", params )..{}

local angle = 0
for i = 9,0,-1 do
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
				self:Load(params.File)
				self:Center()
				BGA_FrameSelector(self, params)

				self:fadebottom(0.0125)
				self:fadetop(0.0125)
				self:diffusealpha(0.875)
				self:croptop( i * 0.1 )
				self:cropbottom( 1 - ( i + 1.5 ) * 0.1 )
				self:sleep((-i+9)/8)
				self:queuecommand("Repeat")

			end,
			RepeatCommand=function(self)

				if angle > 360 then
					angle = angle - 360
				end

				self:smooth(1)
					:x(SCREEN_CENTER_X - math.round( 30 * math.cos(math.rad(angle))))
					:y(SCREEN_CENTER_Y - math.round( 30 * math.sin(math.rad(angle))))
					:queuecommand("Repeat")
				angle = angle + 2.5 + i * 3

			end
		},

		RainbowCommand=function(self)
			self:rainbow():effectperiod(8)
		end

	}
end

return t