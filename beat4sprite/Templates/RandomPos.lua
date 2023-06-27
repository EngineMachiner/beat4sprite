
local parameters = ...						local p = parameters

local numberOf = p.numberOf or 24		local t = beat4sprite.ActorFrame()

for i = 1, numberOf do

	t[#t+1] = beat4sprite.ActorFrame("SetPos") .. {

		OnCommand=function(self) self:playCommands() end,
		
		beat4sprite.Actor(p) .. {

			OnCommand=function(self) self:onRainbow( i * 0.25 ):init()		self.Zoom = self:GetZoom() end,
			SetPosCommand=function(self)

				local n = self:GetNumStates()
				if n > 1 then self:setstate( math.random( 0, n - 1 ) ) end

				local zoom = { math.random( 0, 150 ) * 0.01, math.random( 100, 400 ) * 0.01 }

				if p.Rotation then self:rotationz( math.random(0, 360) ) end

				self:zoom( self.Zoom * zoom[1] / zoom[2] )
				self:xy( math.random( 0, SCREEN_WIDTH ), math.random( 0, SCREEN_HEIGHT ) )
				self:sleep( self:getTweenRate() * 2 ):queuecommand("SetPos")

			end,

		}
		
	}

end	

return t