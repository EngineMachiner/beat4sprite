
local parameters = ...							local p = parameters

local t = Def.ActorFrame{}					beat4sprite.Sprite.bgTemplate(p):Load(t)

local layers = p.Layers or 20				local length = p.Length or 35
local fade = 0.03							local type = parameters.Type or 1

local direction = p.Direction or "UpRight"	
direction = tapLua.Vector.getByName(direction)

local nextPositions = { 
	x = { SCREEN_CENTER_X + direction.x * length, SCREEN_CENTER_X - direction.x * length }, 
	y = { SCREEN_CENTER_Y + direction.y * length, SCREEN_CENTER_Y - direction.y * length }
}

for i = 1, layers do

	t[#t+1] = beat4sprite.ActorFrame() .. { beat4sprite.Actor(p) .. {

		OnCommand=function(self)

			local crop = ( i - 1 ) / layers			crop = { crop, 1 - 1 / layers - crop }
			for k,v in ipairs(crop) do crop[k] = v * 0.95 end

			self:playCommands():init():Center()
			
			self:fadebottom(fade):fadetop(fade):croptop( crop[1] ):cropbottom( crop[2] )

			local sleep = ( layers - i ) / layers
			self:sleep( sleep * self:getTweenRate() ):queuecommand("Spacing")

		end,

		SpacingCommand=function(self)

			local t = self:getTweenRate()

			self:smooth(t):x( nextPositions.x[1] ):y( nextPositions.y[1] )
			self:smooth(t):x( nextPositions.x[2] ):y( nextPositions.y[2] )
			self:queuecommand("Spacing")

		end

	} }
	
end

return t