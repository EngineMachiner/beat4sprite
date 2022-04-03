
local params =  ...
local p = params

local t = Def.ActorFrame{}

if p.Frames[1] == p.Frames[2] then
	p.Default = p.Default or 16
end

local m = p.Sheet[1] * p.Sheet[2]
m = p.Default and p.Default or m

local pos = {}
pos[3] = 1
pos[4] = 0

local function Add( i, w, h )
				
	pos.Sheet = pos.Sheet or { p.Sheet[1] + 1 }
	if not pos.Sheet[2] then
		pos.Sheet[2] = pos.Sheet[1] + p.Sheet[2] - 1
		pos.Sheet[3] = pos.Sheet[2] + p.Sheet[1] - 1
		pos.Sheet[4] = pos.Sheet[3] + p.Sheet[2] - 1
	end

	if i == pos.Sheet[1]
	or i == pos.Sheet[3] then
		pos[4] = pos[3]
		pos[3] = 0
	end

	if i == pos.Sheet[2]
	or i == pos.Sheet[4] then
		pos[3] = - pos[4]
		pos[4] = 0
		pos[7] = 1
	end

	if i == pos.Sheet[3] then
		pos.Sheet[4] = pos.Sheet[4] - 1
		pos.Sheet[1] = pos.Sheet[1] + pos.Sheet[3] - 1
		pos.Sheet[2] = pos.Sheet[1] + p.Sheet[2] - 3
	end

	pos[1] = pos[1] + w * pos[3]
	pos[2] = pos[2] + h * pos[4]

	pos[7] = pos[7] and pos[7] + 1 or pos[7]

end

for i = 1,m do
	
	t[#t+1] = BGA_G.Frame()

	local t = t[#t]
	
	t[#t+1] = Def.Sprite{
		OnCommand=function(self)

			self:Load(p.File)
			BGA_G.ObjFuncs(self)
			self:SetStates(p)

			local d = self:GetDelay(2)
			local w = self:GetZoomedWidth()
			local h = self:GetZoomedHeight()
			self.firstZoom = self:GetZoom()

			pos[1] = pos[1] or SCREEN_CENTER_X - w * math.ceil( p.Sheet[1] * 0.5 )
			pos[2] = pos[2] or SCREEN_CENTER_Y - h * ( - 0.5 + math.ceil( p.Sheet[2] * 0.5 ) )

			if p.Backwards then

				if p.Backwards ~= "On" then

					local n = 1
					while n ~= m do
						n = n + 1
						Add( n, w, h )
					end
	
					pos.Sheet[1] = pos[7] + 1
					pos.Sheet[2] = pos.Sheet[1] + 1 
					pos.Sheet[3] = pos.Sheet[2] + p.Sheet[1] - 2
					pos.Sheet[4] = pos.Sheet[3] + p.Sheet[2] - 3
	
					p.Backwards = "On"
					
				end

				-- pos[7] leads the way...

				if i == pos.Sheet[1]
				or i == pos.Sheet[3] then
					pos[4] = - pos[3]
					pos[3] = 0
				end
			
				if i == pos.Sheet[2]
				or i == pos.Sheet[4] then
					pos[3] = pos[4]
					pos[4] = 0
				end
			
				if i == pos.Sheet[3] then
					pos.Sheet[4] = pos.Sheet[4] + 1
					pos.Sheet[1] = pos.Sheet[1] + pos.Sheet[3] + 2
					pos.Sheet[2] = pos.Sheet[1] + p.Sheet[2] - 1
				end
			
				pos[1] = pos[1] - w * pos[3]
				pos[2] = pos[2] - h * pos[4]

			else

				Add( i, w, h )
				
			end

			self:xy( pos[1], pos[2] )

			self:x( self:GetX() - ( ( p.Sheet[1] + 1 ) % 2 ) * w * 0.5 )
			self:y( self:GetY() - ( p.Sheet[2] % 2 ) * h * 0.5 )

			self:PlayCmds(p)
			
			self:zoom(0)
			self:sleep( 4 * d * (i-1) / m )
			self:queuecommand("Repeat")

			if p.HurryTweenBy then 
				self:hurrytweening( p.HurryTweenBy )
			end

		end,
		TwoSpritesCommand=function(self)
			self:animate(false)
			self:setstate(i % self:GetNumStates())
		end,
		RepeatCommand=function(self)
			local d = self:GetDelay(2)
			local s = 4 * d * (m-1) / m
			self:linear(0.25)
			self:zoom(self.firstZoom)
			self:sleep(s)
			self:linear(0.25):zoom(0)
			self:sleep(s)
			self:queuecommand("Repeat")
		end
	}

end

t = not p.Remove and t

return Def.ActorFrame{ t }