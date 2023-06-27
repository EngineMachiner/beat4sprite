
local parameters = ...			local p = parameters

local t = beat4sprite.ActorFrame()				beat4sprite.Sprite.bgTemplate(p):Load(t)

local numberOf = p.Layers or 20			local fade = 0.015
local magnitude = p.EffectMagnitude or { x = 0, y = 0, z = 0 }

for i = 1, numberOf do

	t[#t+1] = beat4sprite.ActorFrame() .. { beat4sprite.Actor(p) .. {	
			
		OnCommand=function(self)

			self:playCommands():Center():init()

			self:fadeleft(fade):faderight(fade):fadetop(fade):fadebottom(fade)

			local base = 2 + ( i - 1 )
			local nextMag = { x = 2 * base,		y = base,		z = base }
			for k,v in pairs(nextMag) do nextMag[k] = v + magnitude[k] end

			self:wag():effectperiod( self:getEffectRate("MainWarp") * 2 )
			self:effectmagnitude( nextMag.x, nextMag.y, nextMag.z )

			local crop = i * 0.02
			local ratio = SCREEN_WIDTH / SCREEN_HEIGHT

			self:croptop(crop / ratio):cropbottom(crop / ratio)
			self:cropleft(crop):cropright(crop)

		end

	} }
	
end

return t