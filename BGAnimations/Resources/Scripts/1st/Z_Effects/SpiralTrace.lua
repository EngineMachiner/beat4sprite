local params = ...
local ScaleVar = _screen.h/480

	BGA_NoParams( params )

local s, cw = params.Frame_l
local num, total = -1, 0

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		s = params.Frame_l
		num, total = -1, 0	
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(170)
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end

}

if not params.Speed then
	params.Speed = 1
end

if not params.ZSpeed then 
	params.ZSpeed = params.Speed
end

if not params.FrameRotAdd then 
	params.FrameRotAdd = 0
end

if not params.Add then 
	params.Add = 0
end

if not params.RotAdd then 
	params.RotAdd = 0
end

if params.Dir == "Out" then
	params.Dir = { -500, 50, 1 }
else
	params.Dir = { 50, -500, -1 }
end

local n = 6

if params.Clockwise then 
	cw = -1
else
	cw = 1
end

local add, val, val_2 = 0, params.Add, 0

local confirm
if type(params.Commands) == "table" then
	for i = 1,#params.Commands do
		if params.Commands[i] == "FramePerSprite" then 
			confirm = true
			n = n * 2
		end
	end
elseif type(params.Commands) == "string" then
	if params.Commands == "FramePerSprite" then
		confirm = true
		n = n * 2
	end
end

for i=0,360*4-360+val*360/n,360/n do

	if confirm then
		num = num + 1
	end

	if i ~= 360 and not confirm
	or num <= params.Frame_l - val_2 then

		t[#t+1] = Def.ActorFrame{

			GainFocusCommand=function(self)
				self:set_tween_uses_effect_delta(true)
				self:effectclock('beat')
				BGA_ToolPreview(self)
				self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
				self:rotationz( params.FrameRotAdd )
				self:queuecommand("Spin")
			end,

			SpinCommand=function(self)
				self:linear(2*params.Speed):rotationz( self:GetRotationZ() - 360 * cw )
				self:queuecommand("Spin")
			end,
			
			Def.Sprite{
			
				GainFocusCommand=function(self)

					self:set_tween_uses_effect_delta(true)
					self:effectclock('beat')
					self:Load(params.File)
					BGA_FrameSelector(self, params)

			 		if type(params.Commands) == "table" then
			 			for i = 1,#params.Commands do
			 				self:playcommand(params.Commands[i])
			 			end
			 		elseif type(params.Commands) == "string" then
			 			self:playcommand(params.Commands)
			 		end

					if params.Zoom then 
						self:zoom( self:GetZoom() * params.Zoom )
					end

					self:diffusealpha(0)
					if params.NoRot then 
						add = add + 180
						self:rotationz( add + 180 )
					else
						self:rotationz( ( ( - i + 180 ) - 90 ) * cw + params.RotAdd )
					end
					self:sleep(i*n/360):queuecommand("InitState")

				end,
				FramePerSpriteCommand=function(self)

					total = total + 1
					if total == params.Frame_l + 2 then 
						s = math.floor(params.Frame_l * 0.5) - 1
						total = -1
					end

					self:animate(false)

					if s > self:GetNumStates() - 1 then 
						s = s - self:GetNumStates()
					end

					if s < 0 then 
						s = s + self:GetNumStates()
					end
					
					self:setstate(s)
					s = s - 1

				end,
				ColorCommand=function(self)
					self:diffuse(params.Color)
				end,
				InitStateCommand=function(self)

					local angle = 360 + i
					local dir_x = math.cos(math.rad(angle))
					local dir_y = math.sin(math.rad(angle)) * cw
					local val = params.Dir[1] / math.abs(params.Dir[1])
					
					self:diffusealpha(1)
					self:x( self:GetZoomedWidth() * ScaleVar * dir_x )
					self:y( - self:GetZoomedHeight() * ScaleVar * dir_y )
					self:z( params.Dir[1] + i * 0.125 )

					self:queuecommand("Repeat")

				end,
				RepeatCommand=function(self)

					if self:GetZ() > params.Dir[2] and params.Dir[2] > 0
					or self:GetZ() < params.Dir[2] and params.Dir[2] < 0 then
						self:z( self:GetZ() - math.abs( params.Dir[1] + params.Dir[2] ) * 1.5 * params.Dir[3]  )
					else
						self:linear(1*params.ZSpeed)
						self:z( self:GetZ() + 50 * params.Dir[3] )
						if params.NoRot then 
							self:rotationz( self:GetRotationZ() - 180 * cw )
						end
					end
						self:queuecommand("Repeat")

				end

			}

		}

	else

		if confirm then 
			num = -1
			if val_2 == 0 then 
				val_2 = math.floor(params.Frame_l * 0.5) + 1
			else
				val_2 = 0
			end
		end

	end

end

return Def.ActorFrame{ t }