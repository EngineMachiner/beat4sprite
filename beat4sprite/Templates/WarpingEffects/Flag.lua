
local parameters = ...							local p = parameters

local t = beat4sprite.ActorFrame()			beat4sprite.Sprite.bgTemplate(p):Load(t)

local type = p.Type or 1					local layers = p.Layers or 20
local slices = 360 / layers					local fade = 0.02

local function setPos(self)

	local x = 30 * math.cos( math.rad( self.Angle ) )			x = math.ceil(x)
	local y = 30 * math.sin( math.rad( self.Angle ) )			y = math.ceil(y)

	self:xy( SCREEN_CENTER_X - x, SCREEN_CENTER_Y - y )					return self

end

for i = layers, 1, -1 do

	local crop = ( i - 1 ) / layers			crop = { crop, 1 - 1 / layers - crop }
	for k,v in ipairs(crop) do crop[k] = v * 0.95 end

	t[#t+1] = beat4sprite.ActorFrame() .. { beat4sprite.Actor(p) .. {	
			
		OnCommand=function(self)

			self.setPos = setPos
			
			self:playCommands():init():playcommand( "Type" .. type )

			self.Angle = 0
			if p.Skip then self.Angle = layers * ( i - 1 ) * 0.5 end

			self:setPos()

			if not p.Skip then

				local sleep = ( layers - i ) * self:getTweenRate()
				self:sleep( sleep / layers ):queuecommand("Repeat")

			else self:queuecommand("Skip") end

		end,

		SkipCommand=function(self)

			local tween = self:getTweenRate()

			self.Angle = self.Angle + 90
			self:setPos():linear( tween * 0.25 )
			self:sleep( tween * 0.75 ):queuecommand("Skip")

		end,

		RepeatCommand=function(self)

			self.Angle = self.Angle + slices
			self:linear( 2 * self:getTweenRate() / layers )
			self:setPos():queuecommand("Repeat")
				
		end,

		Type1Command=function(self)
			self:croptop( crop[1] ):cropbottom( crop[2] ):fadetop(fade):fadebottom(fade)
		end,

		Type2Command=function(self)
			self:cropleft( crop[1] ):cropright( crop[2] ):fadeleft(fade):faderight(fade)
		end,
			
	} }

end

return t