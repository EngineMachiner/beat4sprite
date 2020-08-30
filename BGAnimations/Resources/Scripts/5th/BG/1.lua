local params = ...
local ScaleVar = _screen.h/480
		
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

if not params.Beat then params.Beat = 2 end

for i = 3,9 do
	t[#t+1] = Def.ActorFrame{

		GainFocusCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_PlayAllCommands(self, params)
		end,

		LoadActor( params.File )..{
			GainFocusCommand=function(self)

				self:effectclock("beat")
				self:set_tween_uses_effect_delta(true)
				self:Center()
					BGA_FrameSelector(self, params)

				self:fadeleft(0.025)
				self:fadetop(0.025)
				self:fadebottom(0.025)
				self:faderight(0.025)
				self:diffusealpha(0.5)
				self:blend("BlendMode_Normal")

				if i < 2 then
					self:pulse():effectperiod(params.Beat)
						:effectmagnitude( 1, 1.015625, 0 )
				else
					self:pulse():effectperiod(params.Beat)
						:effectmagnitude( 1, 1.03125 + ( 1/32 ) * ( i - 2 ), 0 )
					self:croptop( (1/32) * i )
					self:cropbottom( (1/32) * i )
					self:cropleft( (1/32) * i )
					self:cropright( (1/32) * i )
				end

			end
		},

		RainbowCommand=function(self)
			self:rainbow():effectperiod(8)
		end
		
	}
end

return Def.ActorFrame{ t }