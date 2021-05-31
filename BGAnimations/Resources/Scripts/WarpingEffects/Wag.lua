local params = ...

local count = 0

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

	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )

for i = 1,18 do
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			if i == 1 then
				params.Beat = params.Beat * BGA_G.GetDelay(self, params)[2]
			end
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.PlayCmds(self, params)
		end,

		Def.Sprite{
			OnCommand=function(self)

				self:Load( params.File )
				self:Center()
				BGA_G.SetStates(self, params)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)

				self:blend("BlendMode_Normal")

				self:fadeleft( 0.05 )
				self:faderight( 0.05 )
				self:fadetop( 0.05 )
				self:fadebottom( 0.05 )

				self:wag()
				self:effectperiod(2*params.Beat)
				self:effectmagnitude( 8 + 4 * ( i - 1 ), 4 + 2 * ( i - 1 ), 2 + 2 * ( i - 1 ) )

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
			self:rainbow()
			self:effectperiod( 16 * BGA_G.GetDelay(self)[2] )
		end

	}
end

return t