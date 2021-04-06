
local params =  ...

local ScaleVar = _screen.h/480
local v = 0.5
local dir, zzz = 0, 0

BGA_G.DefPar( params )

local t = Def.ActorFrame{}

local pos = {}

local function AddPositions(self)

	for o = -1,2 do
		pos[o+2] = {
			X = SCREEN_CENTER_X + self:GetZoomedWidth() * ( o - 0.5 ),
			Y = SCREEN_CENTER_Y - self:GetZoomedHeight() * 1.5
		}
	end
	for o = -1,1 do
		pos[4+o+2] = {
			X = SCREEN_CENTER_X + self:GetZoomedWidth() * 1.5,
			Y = SCREEN_CENTER_Y + self:GetZoomedHeight() * ( o + 0.5 )
		}
	end
	for o = -1,1 do
		pos[4+3+o+2] = {
			X = SCREEN_CENTER_X - self:GetZoomedWidth() * ( o + 0.5 ),
			Y = SCREEN_CENTER_Y + self:GetZoomedHeight() * 1.5
		}
	end
	for o = 0,1 do
		pos[4+3+3+o+1] = {
			X = SCREEN_CENTER_X - self:GetZoomedWidth() * 1.5,
			Y = SCREEN_CENTER_Y - self:GetZoomedHeight() * ( o - 0.5 )
		}
	end
	for o = 0,1 do
		pos[4+3+3+2+o+1] = {
			X = SCREEN_CENTER_X + self:GetZoomedWidth() * ( o - 0.5 ),
			Y = SCREEN_CENTER_Y - self:GetZoomedHeight() * 0.5
		}
	end
	for o = 0,1 do
		pos[4+3+3+2+2+o+1] = {
			X = SCREEN_CENTER_X - self:GetZoomedWidth() * ( o - 0.5 ),
			Y = SCREEN_CENTER_Y + self:GetZoomedHeight() * 0.5
		}
	end

end

for i = 1,16 do
	
	t[#t+1] = Def.ActorFrame{
		GainFocusCommand=function(self)
			BGA_G.Stop( self, true )
		end,
		LoseFocusCommand=function(self)
			BGA_G.Stop( self )
		end
	}

	local t = t[#t]
	local zoom
	t[#t+1] = Def.Sprite{
		OnCommand=function(self)

			local d = BGA_G.GetDelay(self)[2]

			self:Load(params.File)
			BGA_G.SetStates(self, params)

			if not zoom then AddPositions(self) end
			zoom = self:GetZoom()
			
			if params.Backwards then
				self:xy( pos[17-i]["X"], pos[17-i]["Y"] )
			else
				self:xy( pos[i]["X"], pos[i]["Y"] )
			end

			self:set_tween_uses_effect_delta(true):effectclock("beat")

			BGA_G.PlayCmds(self, params)
			
			self:zoom(0)
			self:sleep( (i-1) * 0.25 * d ):queuecommand("Repeat")

			if params.Speed then 
				self:hurrytweening( params.Speed )
			end

		end,
		TwoSpritesCommand=function(self)
			self:animate(false)
			self:setstate(i % self:GetNumStates())
		end,
		RepeatCommand=function(self)
			local d = BGA_G.GetDelay(self)[2]
			self:linear(0.25 * d):zoom(zoom)
			:sleep(3.75*d)
			:linear(0.25*d):zoom(0)
			:sleep(3.75)
			:queuecommand("Repeat")
		end
	}
end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }