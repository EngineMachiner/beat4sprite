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
	
	local s = "/BGAnimations/Resources/Scripts/TileTool.lua"
	t[#t+1] = loadfile( s )( params )

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

				local n = 0.0125

				self:Load(params.File)
				BGA_G.SetStates(self, params)

				self:Center()
				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:blend("BlendMode_Normal")

				self:fadeleft(n * 2.5)
				self:faderight(n * 2.5)
				self:fadetop(n * 2.5)
				self:fadebottom(n * 2.5)

				self:bob()
				self:effectperiod( 2 * params.Beat )

				local i = 8 + 4 * ( i - 1 )
				local j = 4 + 2 * ( i - 1 )
				self:effectmagnitude( i, j, 0 )

				if i > 2 then
					local c = n * i
					self:croptop(c)
					self:cropbottom(c)
					self:cropleft(c)
					self:cropright(c)
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