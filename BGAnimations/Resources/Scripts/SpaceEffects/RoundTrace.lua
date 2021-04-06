
local params = ...

BGA_G.DefPar( params )

local t = Def.ActorFrame{
	OnCommand=function(self)
		self:zbuffer(true)
		self:SortByDrawOrder()
   		self:fov(120)
	end,
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}


local cw, loop

	params.Dir = params.Dir == "Out" and { -1000, 0 } 
	params.Dir = params.Dir or { 0, -1000 }

if params.Clockwise then 
	cw = -1
	loop = { 360-45, 0, -45 }
else
	cw = 1
	loop = { 0, 360-45, 45 }
end

local scl = _screen.h/480
local num = -2

for i = loop[1], loop[2], loop[3] do

	num = num + 1

	t[#t+1] = Def.ActorFrame{}

	local a = t[#t]

		a[#a+1] = Def.Sprite{
			
		OnCommand=function(self)

			self:set_tween_uses_effect_delta(true)
			self:effectclock('beat')

			self:Load(params.File)
			BGA_G.SetStates(self, params)

			self:rotationz( i * cw + 90 )
			self:diffusealpha(0)
			self:sleep( math.rad( i + 45 ) * 0.5 * BGA_G.GetDelay(self)[2] )
			self:queuecommand("Repeat")
			
		end,
		RepeatCommand=function(self)
			
			if params.Rotation then
				self:rotationz(self:GetRotationZ()+360*2)
			end

			local dir_x = math.cos(math.rad(i))
			local dir_y = math.sin(math.rad(i)) * cw
			local h = self:GetZoomedHeight()
			local p = BGA_G.GetDelay(self)[2]

			self:x( SCREEN_CENTER_X + h * scl * 1.5 * dir_x )
			self:y( SCREEN_CENTER_Y - h * scl * 1.5 * dir_y )
			self:z( params.Dir[1] )
			self:diffusealpha(1)
			self:linear(num*0.5*p):z(params.Dir[2])
			self:linear(0.25*0.5*p):diffusealpha(0)
			self:queuecommand("Repeat")

		end

	}
end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }