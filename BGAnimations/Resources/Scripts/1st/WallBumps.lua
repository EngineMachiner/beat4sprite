
local params = ...

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

PSX_BGA_Globals["BGA_NoParams"]( params )

local function UnitVec()

	local val_x, val_y, norm

	if not val_x and not val_y 
		or norm == 0 then
		val_x = math.random(-1000,1000) * 0.001
		val_y = math.random(-1000,1000) * 0.001
		norm = math.sqrt( (val_x)^2 + (val_y)^2 )
	end

	return { val_x*60/norm, val_y*60/norm }

end

local function Static(self, frame)
	if frame > self:GetNumStates() - 1 then 
		frame = 0
	end
	self:animate(false):setstate(frame)
	frame = frame + 1
end

local count = -0.1
local frame, check = 0

for k=1,3 do
	for i=1,4 do
		if k < 3 or i < 2 and k == 3 then
			local dir
			t[#t+1] = Def.Sprite{
				OnCommand=function(self)

			 		self:effectclock("beat")
			 		self:set_tween_uses_effect_delta(true)

					dir = UnitVec()
					count = count + 0.1
					self:Load(params.File)
					PSX_BGA_Globals["BGA_FrameSelector"](self, params)

					if self:GetNumStates() > 1 then 
						self:setstate(math.random(0,self:GetNumStates()-1))
					end

					PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)

					self:x( self:GetZoomedWidth() * 0.75 * i )
						:y( self:GetZoomedHeight() * 0.75 + self:GetZoomedHeight() * 0.5 * ( k - i * 0.25 ) )
						:sleep(count)
						:queuecommand("Move")
						
				end,
				NoAnimationCommand=function(self)
					self:animate(false):setstate( ( i + k ) % self:GetNumStates() )
				end,
				MoveCommand=function(self)

					if self:GetX() + self:GetZoomedWidth() * 0.5 >= SCREEN_WIDTH
					or self:GetX() - self:GetZoomedWidth() * 0.5 <= 0 then 
						dir[1] = - dir[1]
					end

					if self:GetY() + self:GetZoomedHeight() * 0.5 >= SCREEN_HEIGHT
					or self:GetY() - self:GetZoomedHeight() * 0.5 <= 0 then 
						dir[2] = - dir[2]
					end

					self:linear(0.1875):xy( self:GetX() + dir[1] , self:GetY() - dir[2] )
						:queuecommand("Move")

				end
			}
		else
			break
		end
	end
end

return Def.ActorFrame{ t }