
local params = ...

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
	
}

	BGA_G.DefPar( params )
	
	if not params.Beat then params.Beat = 1 end

	t[#t+1] = LoadActor( "../TileTool.lua", params )..{}

local angle, hurry = 0
for i = 9,0,-1 do
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			if i == 9 then
				params.Beat = params.Beat * BGA_G.GetDelay(self, params)[2]
			end
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.PlayCmds(self, params)
		end,

		Def.Sprite{
			OnCommand=function(self)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:Load(params.File)
				self:Center()
				BGA_G.SetStates(self, params)

				self:fadebottom(0.0125)
				self:fadetop(0.0125)
				self:diffusealpha(0.875)
				self:croptop( i * 0.1 )
				self:cropbottom( 1 - ( i + 1.5 ) * 0.1 )
				self:x( SCREEN_CENTER_X - math.ceil( 30 * math.cos( math.rad(angle) ) ) )
				self:y( SCREEN_CENTER_Y - math.ceil( 30 * math.sin( math.rad(angle) ) ) )
				self:sleep((-i+9)*params.Beat/8)
				self:queuecommand("Repeat")

			end,
			RepeatCommand=function(self)

				if angle > 360 then
					angle = angle - 360
				end

				self:smooth(params.Beat)
					:x( SCREEN_CENTER_X - math.ceil( 30 * math.cos( math.rad(angle) ) ) )
					:y( SCREEN_CENTER_Y - math.ceil( 30 * math.sin( math.rad(angle) ) ) )
					:queuecommand("Repeat")
				angle = angle + 2.5 + i * 3

			end
		},

		RainbowCommand=function(self)
			self:rainbow()
			self:effectperiod( 16 * BGA_G.GetDelay(self)[2] )
		end

	}
end

return t