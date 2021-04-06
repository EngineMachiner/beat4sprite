local params = ...
local ScaleVar = _screen.h/480
		
local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

	BGA_G.DefPar( params )
	
	t[#t+1] = LoadActor( "../TileTool.lua", params )..{}

if not params.Beat then params.Beat = 2 end

for i = 3,9 do
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			if i == 3 then
				params.Beat = params.Beat * BGA_G.GetDelay(self, params)[2]
			end
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.PlayCmds(self, params)
		end,

		LoadActor( params.File )..{
			OnCommand=function(self)

				self:effectclock("beat")
				self:set_tween_uses_effect_delta(true)
				self:Center()
				BGA_G.SetStates(self, params)

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
			self:rainbow()
			self:effectperiod( 16 * BGA_G.GetDelay(self)[2] )
		end
		
	}
end

return Def.ActorFrame{ t }