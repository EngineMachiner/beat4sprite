
-- We basically have to build a new matrix and use that as the order.

local params =  ...			local p = params

local columns, rows = p.Columns, p.Rows

local function onDefault(t, value) return t[1] == t[2] and t[1] == 0 end

-- 5x4 matrix by default.
if onDefault(columns) then columns = 2 end
if onDefault(rows) then rows = { -2, 1 } end

p:tweak {
	Columns = columns,				Rows = rows,
	Script = "Tile.lua",			Run = function(self) self:queuecommand("Spiral") end
}

local main = p:Load()		local t = main.getParameterActor()[1]

local matrix = {}

local index = 0
local numberOf = p.numberOf
local skipX, skipY = p.numberOf.x, p.numberOf.y

local function getValue(a) return a - 1 end

-- Avoid stack overflow.
if #t < numberOf.items then error("ActorFrame doesn't have enough sprites!") end

-- Build the matrix
while true do

	for i = 1, skipX do index = index + 1						matrix[#matrix+1] = t[index] end
	skipY = getValue(skipY)						if #matrix >= numberOf.items then break end

	for i = 1, skipY do index = index + numberOf.x 				matrix[#matrix+1] = t[index] end
	skipX = getValue(skipX)						if #matrix >= numberOf.items then break end

	for i = 1, skipX do index = index - 1 						matrix[#matrix+1] = t[index] end
	skipY = getValue(skipY)						if #matrix >= numberOf.items then break end

	for i = 1, skipY do index = index - numberOf.x 				matrix[#matrix+1] = t[index] end
	skipX = getValue(skipX)						if #matrix >= numberOf.items then break end

end

for i = 1, #matrix do

	local item = matrix[i][1]

	item.SpiralCommand=function(self)

		local time = i - 1			if p.Backwards then time = #matrix - time end	
		
		time = time * self:getTweenRate() * 0.125

		self.initZoom = self:GetZoom()
		self:zoom(0):sleep(time):queuecommand("SpiralZoom")

	end

	item.SpiralZoomCommand=function(self)

		local zoom, time = self.initZoom, self:getTweenRate()
		local t1 = time * 0.125			local t2 = time * 4 - t1

		self:linear(t1):zoom(zoom):sleep(t2):linear(t1):zoom(0):sleep(t2)
		self:queuecommand("SpiralZoom")

	end

end

return main