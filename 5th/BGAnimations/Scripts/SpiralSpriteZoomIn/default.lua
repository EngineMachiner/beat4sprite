local ScaleVar = _screen.h/480
local file, delay =  ...
local t = Def.ActorFrame{};
local tbl = {1}

local function Animation( self, x_var, y_var, loop_sleep )

	self:x(SCREEN_CENTER_X+80*x_var*ScaleVar)
	self:y(SCREEN_CENTER_Y+60*y_var*ScaleVar)
	self:zoom(0)

	local function LessSleep( tween_num )
		self:sleep(loop_sleep*0.2375)
		:hurrytweening(tween_num)
		:linear(0.25):zoom(ScaleVar)
		:sleep((3*5+1)*0.2375)
		:linear(0.25):zoom(0)
		:sleep((3*5+1)*0.2375)
		tbl[1] = tbl[1]*0.95
	end

	self:queuecommand("On", LessSleep(tbl[1])  )

	self:effectclock('beat')
	self:set_tween_uses_effect_delta(true)
	self:SetAllStateDelays(delay)
end

local function BarX( num_x, limit, num_y, var, reverse, sleep_num )
	for i=num_x,limit,var do
		t[#t+1] = Def.Sprite{
				Texture = file,
				OnCommand=function(self)
					if not reverse then
						Animation( self, i, num_y, ( ( i - 1 ) * 0.5 ) + 2 + sleep_num )
					else
						Animation( self, i, num_y, math.abs( ( ( ( 1 - i ) * 0.5 ) + 2 ) ) + sleep_num )
					end
				end
			};
	end
end

local function BarY( num_x, limit, num_y, var, reverse, sleep_num )
	for k=num_y,limit,var do
		t[#t+1] = Def.Sprite{
				Texture = file,
				OnCommand=function(self)
					if not reverse then
						Animation( self, num_x, k, ( ( k - 1 ) * 0.5 ) + 2 + sleep_num )
					else
						Animation( self, num_x, k, math.abs( ( ( ( 1 - k ) * 0.5 ) + 2 ) ) + sleep_num )
					end
				end
			};
	end
end

BarX( -3, 1, -3, 2, false, 0 )
BarY( 3, 1, -3, 2, false, 3 )
BarX( -1, 3, 3, 2, true, 3*2-1 )
BarY( -3, 3, 1, 2, true, 3*3-1 )
BarX( -3, -1, -1, 2, false, 3*4-1 )
BarY( 1, 1, -1, 2, false, 3*4 )
BarX( -1, -1, 1, 2, true, 3*4  )

return t
