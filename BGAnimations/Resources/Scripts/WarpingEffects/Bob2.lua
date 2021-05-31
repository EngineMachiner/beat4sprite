
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

	params.Beat = params.Beat or 1

	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )

local n = 18
for i=0,n do

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			if i == 0 then
				params.Beat = params.Beat * BGA_G.GetDelay(self, params)[2]
			end
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.PlayCmds(self, params)
		end,

		RainbowCommand=function(self)
			self:rainbow()
			self:effectperiod( 16 * BGA_G.GetDelay(self, params)[2] )
		end,

		Def.Sprite{
			OnCommand=function(self)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:Center()
				self:Load( params.File )
				self:diffusealpha(0.75)
				BGA_G.SetStates(self, params)

				local mag = 6
				local val = ( i % 2 ) * mag * 2 - mag
				self:bob():effectperiod(params.Beat):effectmagnitude(val,0,0)

				self:fadetop( 0.0125 )
				self:fadebottom( 0.0125 )

				self:croptop( i / n )
				self:cropbottom( 1 - ( i + 1.2 ) / n )

			end

		}

	}

end

return Def.ActorFrame{ t }