local params = ...

params.Sleep = params.Sleep or 4
params.Alphas = params.Alphas or { 1 }

if #params.File == 1 then
	local p = params.File
	p[#p+1] = p[1]
end

local t = BGA_G.Frame()

local crops = {
	{ 0, 0.5, 0, 0.5, -1, -1 },
	{ 0, 0.5, 0.5, 0, 1, -1 },
	{ 0.5, 0, 0, 0.5, -1, 1 },
	{ 0.5, 0, 0.5, 0, 1, 1 }
}

-- Static Background with alphas

local par = BGA_G.BGSet(params)
par.X_num = { 0, 0 }
for _,v in ipairs( params.Alphas ) do
	par.File = params.File[v]
	par:Load(t)
end

local function Switch(val)

	local v = val

	if not params.Dir then
		v = v + 1
	else
		v = v - 1
	end

	if v > #params.File then 
		v = 1
	end

	if v <= 0 then 
		v = #params.File
	end

	return v

end
	
local c, c2 = 1, #params.File

if not params.Dir then
	c = c + 1
else
	c2 = c2 + 1
end

-- Background that changes

t[#t+1] = Def.Sprite{
	OnCommand=function(self)
		
		BGA_G.ObjFuncs(self)

		self:Load(params.File[c])
		self:SetStates( params )

		self:Center()
		self:sleep( params.Sleep * self:GetDelay(2) )
		c = Switch(c)
		self:queuecommand("On")

	end
}

-- Split

for i=1,4 do

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)

			BGA_G.ObjFuncs(self)

			self:sleep( params.Sleep * self:GetDelay() )
			if i == 1 then c2 = Switch(c2) end
			self:queuecommand("On")

		end,

		Def.Sprite{
			OnCommand=function(self)
				
				BGA_G.ObjFuncs(self)

				self:Load(params.File[c2])
				self:SetStates( params )

				self:Center()
				self:croptop(crops[i][1])
				self:cropbottom(crops[i][2])
				self:cropleft(crops[i][3])
				self:cropright(crops[i][4])
				self:queuecommand("Split")

			end,
			SplitCommand=function(self)

				local w = self:GetZoomedWidth()
				local h = self:GetZoomedHeight()
				local l = 4 * self:GetDelay(2)
				if BGA_G.IsScreenAvailable("Preview") then
					l = l * 0.75
				end

				local x = self:GetX() + w * 0.5 * crops[i][5]
				local y = self:GetY() + h * 0.5 * crops[i][6]
			
				if not params.Dir then
					self:Center():linear(l):xy( x, y )
				else
					self:xy( x, y ):linear(l):Center()
				end

			end
		}

	}

end

for i=-1, 1, 2 do
	par = par:Copy()
	par:ParTweak( { X_pos = i, Rot = { 0, 180, 0 } } )
	par:Load(t)
end

t = not params.Remove and t

return Def.ActorFrame{ t }