local ScaleVar = _screen.h/480
local sprites, Reversed =  ...

local tbl = {}
tbl.dir = 0

local t = Def.ActorFrame{
	
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

local function Animation( self, x_var, y_var, loop_sleep )

	if type(sprites) == "table" then 

		if tbl.dir >= #sprites then 
			tbl.dir = 0
		end

		tbl.dir = tbl.dir + 1
		self:Load(sprites[tbl.dir])

	else

		self:Load(sprites)

	end

	self:x(SCREEN_CENTER_X+80*x_var*ScaleVar)
	self:y(SCREEN_CENTER_Y+60*y_var*ScaleVar)
	self:zoom(0)
	self:sleep( loop_sleep*0.25*0.5 ):queuecommand("Repeat")
	self:effectclock('beat')
	self:set_tween_uses_effect_delta(true)
	ToolPreview(self)
	self:SetAllStateDelays( 1/(self:GetNumStates()) )

end

local function BarX( num_x, limit, num_y, var, reverse, sleep_num )
	for i=num_x,limit,var do
		t[#t+1] = Def.Sprite{
				OnCommand=function(self)
					if not reverse then
						Animation( self, i, num_y, ( ( i - 1 ) * 0.5 ) + 2 + sleep_num )
					else
						Animation( self, i, num_y, math.abs( ( ( ( 1 - i ) * 0.5 ) + 2 ) ) + sleep_num )
					end
				end,
				RepeatCommand=function(self)
					self:SetAllStateDelays( 1/(self:GetNumStates()) )
					:linear( 0.5 ):zoom( ScaleVar )
					:sleep( 14*0.25*0.5*2 )
					:linear( 0.5 ):zoom( 0 )
					:sleep( 14*0.25*0.5*2 )
					:queuecommand("Repeat")

				end
			};
	end
end

local function BarY( num_x, limit, num_y, var, reverse, sleep_num )
	for k=num_y,limit,var do
		t[#t+1] = Def.Sprite{
				OnCommand=function(self)
					if not reverse then
						Animation( self, num_x, k, ( ( k - 1 ) * 0.5 ) + 2 + sleep_num )
					else
						Animation( self, num_x, k, math.abs( ( ( ( 1 - k ) * 0.5 ) + 2 ) ) + sleep_num )
					end
				end,
				RepeatCommand=function(self)
					self:SetAllStateDelays( 1/(self:GetNumStates()) )
					:linear( 0.5 ):zoom( ScaleVar )
					:sleep( 14*0.25*0.5*2 )
					:linear( 0.5 ):zoom( 0 )
					:sleep( 14*0.25*0.5*2 )
					:queuecommand("Repeat")
				end
			};
	end
end

if Reversed then

	BarY( -3, 3, 1, 2, false, 3*3 - 1 )

	BarX( -3, 1, -3, 2, true, 3*6 )
	BarY( 3, 1, -3, 2, true, 3*5 )
	BarX( -1, 3, 3, 2, false, 3*4 - 1 )

	BarX( -3, -1, -1, 2, true, 3*2 - 1 )
	BarY( 1, 1, -1, 2, true, 3 )
	BarX( -1, -1, 1, 2, false, 3 )

else

	BarY( -3, 3, 1, 2, true, 3*4 - 1 )

	BarX( -3, 1, -3, 2, false, 3 )
	BarY( 3, 1, -3, 2, false, 3*2 )
	BarX( -1, 3, 3, 2, true, 3*3 - 1 )
	
	BarX( -3, -1, -1, 2, false, 3*5 - 1 )
	BarY( 1, 1, -1, 2, false, 3*5 )
	BarX( -1, -1, 1, 2, true, 3*5 )
end

return t
