
local params = ...

local num, fov = params.Num or 12, 150

if params.File:match("1st/") then
	num = num * 2		fov = 170
end

local t = BGA_G.Frame() .. {
	OnCommand=function(self)
		BGA_G.ObjFuncs(self)
		self:Center3D()
		self:fov(fov):zbuffer(true)
	end
}

for i=1,num do

	t[#t+1] = Def.ActorFrame{
		OnCommand=function(self)
			BGA_G.ObjFuncs(self)
			local d = self:GetFullDelay(params) * 6 / num
			self:sleep( ( i - 1 ) * d )
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			local d = self:GetFullDelay(params)
			local t1, t2 = d * 0.5, d * 4

			self:z(- 600):linear(t1 * 2 + t2):z(0)
			self:queuecommand("Repeat")
		end
	}
	local a = t[#t]
	
	a[#a+1] = Def.ActorFrame{

		OnCommand=function(self)
			BGA_G.ObjFuncs(self)	self:diffusealpha(0)
		end,
		RepeatCommand=function(self)
			
			local d = self:GetFullDelay(params)
			local t1, t2 = d * 0.5, d * 4

			self:stoptweening()
			self:queuecommand("Bump")
			self:linear(t1):diffusealpha(1)
			self:sleep(t2):linear(t1):diffusealpha(0)

		end,

		Def.Sprite{	
			Texture=params.File,
			OnCommand=function(self)

				BGA_G.ObjFuncs(self)

				self:SetStates(params)
				self:PlayCmds(params)

				self:bounce()

				if params.Static then
					self:animate(false)
				end

			end,
			RandomInitStateCommand=function(self)
				local n = self:GetNumStates()
				n = math.random( 0, n - 1 )
				self:setstate(n)
			end,
			BumpCommand=function(self)

				local w = self:GetZoomedWidth() * 0.5
				local h = self:GetZoomedHeight()
				local a = { - SCREEN_WIDTH * 0.5, SCREEN_WIDTH * 1.5 }

				self:y( SCREEN_HEIGHT - h )
				self:x( math.random( a[1], a[2] ) )

				local mag = - h * 1.5 - ( i * 10 )
				mag = mag - math.random(100,1000) * 0.1
				local off = ( i - 1 ) * 2 / num
				local per = self:GetFullDelay(params) * 1.25

				if params.File:match("/Resources/1st/") then
					mag = mag * 2	off = off * 2
					per = per * 2
				end

				self:effectmagnitude(0,mag,0)
				self:effectperiod(per)
				self:effectoffset(off)
				
			end
		}

	}

end

t = not params.Remove and t

return Def.ActorFrame{ t }