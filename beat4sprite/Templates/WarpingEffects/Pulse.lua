local parameters = ...				local p = parameters

local t = Def.ActorFrame{}		beat4sprite.Sprite.bgTemplate(p):Load(t)

local fade = 0.008				local numberOf = p.Layers or 20

local amplitude = p.Amplitude or 1
local magnitude = p.EffectMagnitude or { x = 0, y = 0, z = 0 }

for i = 1, numberOf do

	t[#t+1] = beat4sprite.ActorFrame() .. { beat4sprite.Actor(p) .. {

		OnCommand=function(self)

			local ratio = SCREEN_WIDTH / SCREEN_HEIGHT
			local crop = i * 0.025 * amplitude
			local cropY = crop / ratio

			local period = self:getEffectRate("MainWarp")

			self:playCommands():Center():init():diffusealpha(0.75)

			self:fadeleft(fade):faderight(fade):fadetop(fade):fadebottom(fade)

			self:cropleft(crop):cropright(crop):croptop(cropY):cropbottom(cropY)

			self:pulse():effectperiod( period * 2 )

			local nextMag = { x = 1, y = 1 + i * 0.25 / ( numberOf * 0.5 ), z = 0 }
			for k,v in pairs(nextMag) do nextMag[k] = v + magnitude[k] end
			self:effectmagnitude( nextMag.x, nextMag.y, nextMag.z )

		end

	} }
	
end

return t