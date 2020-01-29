local tbl_2 = {}
local sprite = ...
local ScaleVar = _screen.h/480
local t = Def.ActorFrame{}

local ParamsTFSides = {
	NumParticles = math.round( _screen.w / 80 - 1 ),
}

local ParamsLRSides = {
	NumParticles = math.round( _screen.h / 80 ),
}

tbl_2["count"] = 1

local function SetState( self, i )

	local tbl = {}
	tbl["state"] = 0
	tbl["state"] = tbl["state"] + i

	if tbl["state"] > self:GetNumStates() - 1 then
		tbl["state"] = 0
	end

	return tbl["state"]

end

for i=-1,ParamsTFSides.NumParticles do
	-- starts at 35
	t[#t+1] = Def.Sprite{

		OnCommand=function(self)

			if type(sprite) == "table" then
				if tbl_2["count"] > #sprite then
					tbl_2["count"] = 1
				end
				self:Load(sprite[tbl_2["count"]])
				tbl_2["count"] = tbl_2["count"] + 1
			else
				self:Load(sprite)
			end

			self:diffusealpha(0)
				:zoom(ScaleVar)
				:sleep( ( i + 1 ) * ( 0.25 + 0.25 * 0.5 ) )
				:diffusealpha(1)
				:xy( SCREEN_WIDTH - self:GetWidth() * 0.5 * i , - self:GetHeight() )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:setstate( SetState( self, i + 1 ) ):SetAllStateDelays(2*self:GetNumStates()^-1)
				:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:sleep(8.5):zoom(ScaleVar)
				:xy( SCREEN_WIDTH - self:GetWidth() * 0.5 * i , - self:GetHeight() )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:queuecommand("Repeat")
		end

	}

end

for i=0,ParamsLRSides.NumParticles + 2 do

	t[#t+1] = Def.Sprite{

		OnCommand=function(self)

			if type(sprite) == "table" then
				if tbl_2["count"] > #sprite then
					tbl_2["count"] = 1
				end
				self:Load(sprite[tbl_2["count"]])
				tbl_2["count"] = tbl_2["count"] + 1
			else
				self:Load(sprite)
			end

			self:finishtweening():zoom(ScaleVar)
				:diffusealpha(0)
				:sleep( 4 + ( i + 1 ) * ( 0.25 + 0.25 * 0.5 ) )
				:diffusealpha(1)
				:xy( - self:GetWidth() , self:GetHeight() * 0.5 * i - self:GetHeight()  )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:setstate( SetState( self, i ) ):SetAllStateDelays(2*self:GetNumStates()^-1)
				:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:sleep(8.5):zoom(ScaleVar)
				:xy( - self:GetWidth() , self:GetHeight() * 0.5 * i - self:GetHeight() )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:queuecommand("Repeat")
		end

	}

end

for i=-1,ParamsTFSides.NumParticles + 4 do

	t[#t+1] = Def.Sprite{

		OnCommand=function(self)

			if type(sprite) == "table" then
				if tbl_2["count"] > #sprite then
					tbl_2["count"] = 1
				end
				self:Load(sprite[tbl_2["count"]])
				tbl_2["count"] = tbl_2["count"] + 1
			else
				self:Load(sprite)
			end

			self:finishtweening():zoom(ScaleVar)
				:diffusealpha(0)
				:sleep( 5 + 5 * 0.5 + ( i + 1 ) * ( 0.25 + 0.25 * 0.5 ) )
				:diffusealpha(1)
				:xy( self:GetWidth() * 0.5 * i - self:GetWidth() , SCREEN_HEIGHT + self:GetHeight() )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:setstate( SetState( self, i + 1 ) ):SetAllStateDelays(2*self:GetNumStates()^-1)
				:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:sleep(8.5):zoom(ScaleVar)
				:xy( self:GetWidth() * 0.5 * i - self:GetWidth() , SCREEN_HEIGHT + self:GetHeight() )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:queuecommand("Repeat")
		end

	}

end

for i=-1,ParamsLRSides.NumParticles do

	t[#t+1] = Def.Sprite{

		OnCommand=function(self)

			if type(sprite) == "table" then
				if tbl_2["count"] > #sprite then
					tbl_2["count"] = 1
				end
				self:Load(sprite[tbl_2["count"]])
				tbl_2["count"] = tbl_2["count"] + 1
			else
				self:Load(sprite)
			end

			self:finishtweening():zoom(ScaleVar)
				:diffusealpha(0)
				:sleep( 6 * 2 + 1.5 + ( i + 1 ) *( 0.25 + 0.25 * 0.5 ) )
				:diffusealpha(1)
				:xy( SCREEN_WIDTH + self:GetWidth() , SCREEN_HEIGHT - self:GetHeight() * 0.5 * i  )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:setstate( SetState( self, i + 1 ) ):SetAllStateDelays(2*self:GetNumStates()^-1)
				:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:sleep(8.5):zoom(ScaleVar)
				:xy( SCREEN_WIDTH + self:GetWidth() , SCREEN_HEIGHT - self:GetHeight() * 0.5 * i )
				:z(125*ScaleVar)
				:linear(8)
				:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):z(-125*ScaleVar)
				:linear(0.25):zoom(0)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:queuecommand("Repeat")
		end

	}

end

t.GainFocusCommand=function(self)
    self:SortByDrawOrder()
    self:fov(170)
end	

return t