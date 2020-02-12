local s, n, p, w, delay = ...
local ScaleVar = _screen.h/480
local t = Def.ActorFrame{}

local function SpriteCreation(s, n, p, w, delay)

	local tbl = {}
	local numStates = 0
	local lowState = 0

		tbl["string"] = string.match( s, "%dx%d" )
		tbl[1] = tonumber( string.match( tbl["string"], "%d" ) )
		tbl[2] = tonumber( string.match( string.match( tbl["string"], "x%d" ), "%d" ) )

		if tbl[1] > tbl[2] then 
			numStates = tbl[1]
			lowState = tbl[2]
		else
			numStates = tbl[2]
			lowState = tbl[1]
		end

	for i=1,lowState do
		t[#t+1] = LoadActor(s)..{
			OnCommand=function(self)
				
				self:set_tween_uses_effect_delta(true):effectclock('beat')

				if self:GetX() < SCREEN_LEFT - self:GetWidth() * 4
				or self:GetX() > SCREEN_RIGHT + self:GetWidth() * 4
				or self:GetY() < SCREEN_TOP - self:GetHeight() * 3
				or self:GetY() > SCREEN_BOTTOM + self:GetHeight() * 3 then 
					self:visible(false)
				end

			end,
			PulseCommand=function(self)
				self:zoom(ScaleVar):smooth(1):zoom(0):smooth(1):zoom(ScaleVar)
					:queuecommand("Pulse")
			end,
			RainbowCommand=function(self)
				self:rainbow()
					:effectoffset(((w-1)*i+self:GetNumStates())*0.25)
					:effectperiod(8)
			end,
			NoAnimationCommand=function(self)
				self:animate(false)
				self:setstate(i+p-1)
					:xy( SCREEN_CENTER_X + self:GetWidth() * ( i - 3 ) ,
						 SCREEN_TOP + self:GetHeight() * 0.5 * n )
			end,
			ClothesCommand=function(self)
				self:xy( SCREEN_CENTER_X + self:GetWidth() * ( i - 3 ) ,
						 SCREEN_TOP + self:GetHeight() * 0.5 * n )
				local tbl_2 = {}
				for k = p+5*(i-1),numStates+p-1+5*(i-1) do
					if k > tbl[1] * tbl[2] - 1 then 

						tbl_2[#tbl_2+1] = { Frame = k - tbl[1] * tbl[2],
											Delay = delay }						
					else
						tbl_2[#tbl_2+1] = { Frame = k,
											Delay = delay }					
					end

				end
				self:SetStateProperties(tbl_2)
			end
		}
	end

end

	SpriteCreation( s, n, p, w, delay )

return Def.ActorFrame{ t }