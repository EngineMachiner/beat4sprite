
local params = ...						local p = params

local t = beat4sprite.ActorFrame()		beat4sprite.Sprite.bgTemplate(p):Load(t)

-- Number of layers.
local numberOf = p.Layers or 18			local type = p.Type or 1
local magnitude = p.EffectMagnitude or { x = 0, y = 0, z = 0 }

local fade = 0.015

for i = 1, numberOf do

	t[#t+1] = beat4sprite.ActorFrame() .. { beat4sprite.Actor(p) .. {	
			
		OnCommand=function(self) 
			self:playCommands():Center():init():bob()
			self:effectperiod( self:getEffectRate("MainWarp") )
			self:queuecommand( "Type" .. type )
		end,

		Type1Command=function(self)

			local half = numberOf * 0.5

			-- Keep it square.
			local ratio = SCREEN_WIDTH / SCREEN_HEIGHT
			local amplitude = 1.25			local crop = i * 0.01 * amplitude
			local amp2 = 2 + ( i - half ) / ( amplitude * 1.25 )

			local nextMag = { x = 4 * amp2, y = 2 * amp2, z = 0 }

			for k,v in pairs(nextMag) do nextMag[k] = v + magnitude[k] end

			self:fadeleft(fade):faderight(fade):fadetop(fade):fadebottom(fade)

			self:croptop( crop / ratio ):cropbottom( crop / ratio )
			self:cropleft(crop):cropright(crop)

			self:effectperiod( 2 * self:getEffectRate("MainWarp") )		
			self:effectmagnitude( nextMag.x, nextMag.y, nextMag.z )

		end,

		Type2Command=function(self)

			local amplitude = 2				local x = amplitude * ( 2 * ( i % 2 ) - 1 )

			self:diffusealpha(0.75)

			self:fadetop( fade ):fadebottom( fade )

			self:croptop( i / numberOf ):cropbottom( 1 - ( i + 1.2 ) / numberOf )

			self:effectmagnitude( x + magnitude.x, magnitude.y, magnitude.z )

		end,

		Type3Command=function(self)

			local amplitude = 4				local y = amplitude * ( 2 * ( i % 2 ) - 1 )

			self:effectmagnitude( magnitude.x, y + magnitude.y, magnitude.z )

			self:fadeleft( fade ):faderight( fade )

			self:cropleft( i / numberOf ):cropright( 1 - ( i + 1.2 ) / numberOf )

		end

	} }

end

return t