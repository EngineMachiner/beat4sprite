local ScaleVar = _screen.h/480
local sprites, Reversed, slow =  ...

local dir = 0
local v = 0.5
local zzz = 0

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self:playcommand("Repeat")
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) 
			child:visible(false):finishtweening()
		end)
	end

}

if slow then 
	v = 1
end

local function Animation( self, x_var, y_var, loop_sleep )

	if type(sprites) == "table" then 
		if dir >= #sprites then 
			dir = 0
		end
		dir = dir + 1
		self:Load(sprites[dir])
	else
		self:Load(sprites)
	end

	zzz = loop_sleep + 0.75
	zzz = zzz * v
	self:x(SCREEN_CENTER_X+80*x_var*ScaleVar)
	self:y(SCREEN_CENTER_Y+60*y_var*ScaleVar)
	self:zoom(0)
	self:sleep( zzz ):queuecommand("Repeat")
	self:effectclock('beat')
	self:set_tween_uses_effect_delta(true)
	ToolPreview(self)
	AnimationDelay(self)

end

local function BarX( num_x, limit, num_y, var, reverse, sleep_num )
	for i=num_x,limit,var do
		t[#t+1] = Def.Sprite{
				OnCommand=function(self)
					if not reverse then
						Animation( self, i, num_y, ( ( ( i - 1 ) * 0.5 ) + 2 + sleep_num ) )
					else
						Animation( self, i, num_y, ( math.abs( ( ( ( 1 - i ) * 0.5 ) + 2 ) ) + sleep_num ) )
					end
				end,
				RepeatCommand=function(self)
					self:linear( 0.25 ):zoom( ScaleVar )
						:sleep( 14.75 * v )
						:linear( 0.25 ):zoom( 0 )
						:sleep( 14.75 * v )
						:queuecommand("Repeat")
				end
			}
	end
end

local function BarY( num_x, limit, num_y, var, reverse, sleep_num )
	for k=num_y,limit,var do
		t[#t+1] = Def.Sprite{
				OnCommand=function(self)
					if not reverse then
						Animation( self, num_x, k, ( ( ( k - 1 ) * 0.5 ) + 2 + sleep_num ) )
					else
						Animation( self, num_x, k, ( math.abs( ( ( ( 1 - k ) * 0.5 ) + 2 ) ) + sleep_num ) )
					end
				end,
				RepeatCommand=function(self)
					self:linear( 0.25 ):zoom( ScaleVar )
						:sleep( 14.75 * v )
						:linear( 0.25 ):zoom( 0 )
						:sleep( 14.75 * v )
						:queuecommand("Repeat")
				end
			}
	end
end

if Reversed then

	BarX( 1, -3, -3, -2, true, 0.75 + 3 * 5 - 1 )
	BarY( 3, -3, 1, -2, true, 0.75 + 3 * 3 + 2 )
	BarX( -1, 3, 3, 2, false, 0.75 + 3 * 3 )
	BarY( -3, 3, 1, 2, false, 0.75 + 3 * 2 )
	BarX( -1, -3, -1, -2, true, 0.75 + 3 )
	BarY( 1, -1, 1, -2, true, 0.75 + 2 )
	BarX( -1, -1, 1, -2, true, 0.75 )
	
else

	BarX( -1, -1, 1, -2, true, 0.75 + 3 * 2 + 2 * 2 + 2 )
	BarY( 1, 1, -1, 2, false, 0.75 + 3 * 2 + 2 * 2 + 2 )
	BarX( -3, -1, -1, 2, false, 0.75 + 3 * 2 + 2 * 2 + 1 )
	BarY( -3, 1, 3, -2, true, 0.75 + 3 * 2 + 2 )
	BarX( 3, -1, 3, -2, true, 0.75 + 3 + 2 )
	BarY( 3, 1, -3, 2, false, 0.75 + 3 )
	BarX( -3, 1, -3, 2, false, 0.75 )

end

return t
