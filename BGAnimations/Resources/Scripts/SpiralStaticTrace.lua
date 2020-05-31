
local params =  ...

local ScaleVar = _screen.h/480
local v = 0.5
local dir, zzz = 0, 0

BGA_NoParams( params )

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end

}

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
	local zoom
	t[#t+1] = Def.Sprite{
		GainFocusCommand=function(self)

			self:Load(params.File)
			BGA_FrameSelector(self, params)

			if not zoom then AddPositions(self) end
			zoom = self:GetZoom()
			
			if params.Backwards then
				self:xy( pos[17-i]["X"], pos[17-i]["Y"] )
			else
				self:xy( pos[i]["X"], pos[i]["Y"] )
			end

			self:set_tween_uses_effect_delta(true):effectclock("beat")

			if type(params.Commands) == "table" then
			 	for i = 1,#params.Commands do
			 		self:playcommand(params.Commands[i])
			 	end
			elseif type(params.Commands) == "string" then
			 	self:playcommand(params.Commands)
			end

			self:sleep( (i-1) * 0.25 ):queuecommand("Repeat")

			if params.Speed then 
				self:hurrytweening( params.Speed )
			end

		end,
		TwoSpritesCommand=function(self)
			self:animate(false)
			self:setstate(i % self:GetNumStates())
		end,
		RepeatCommand=function(self)
			self:linear(0.25):zoom(0)
			:sleep(4-0.25)
			:linear(0.25):zoom(zoom)
			:sleep(4-0.25)
			:queuecommand("Repeat")
		end
	}
end

return Def.ActorFrame{ t }