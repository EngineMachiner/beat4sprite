
local params = ...		local p = params	

local files = p.File

local alphas = p.Alphas or { 1 }			local t = beat4sprite.ActorFrame()

local pos = {	{ -1, -1 }, { 1, -1 }, { -1, 1 }, { 1, 1 }	}

local crops = {
	{ 0, 0.5, 0, 0.5 },		{ 0, 0.5, 0.5, 0 },		{ 0.5, 0, 0, 0.5 },
	{ 0.5, 0, 0.5, 0 },
}

local template = beat4sprite.Sprite.bgTemplate(p):tweak { File = files[ alphas[#alphas] ] }
template:Load(t)

-- Static Background with alphas.
for _, v in ipairs(alphas) do
	local template = beat4sprite.Sprite.bgTemplate(p):tweak { Columns = 0, File = files[v] }
	template:Load(t)
end

local cyclingSprite = loadfile( beat4sprite.Paths.Templates .. "Cyclic/Sprite.lua" )

-- Background that changes.
p.FileIndex = p.Step or 1		t[#t+1] = beat4sprite.ActorFrame() .. { cyclingSprite(p) }		
p.FileIndex = nil

p:addCommand("Split")

-- Sprites that split.
for i=1,4 do

	t[#t+1] = beat4sprite.ActorFrame() .. { cyclingSprite(p) .. {

		OnCommand=function(self)

			local crop = crops[i]

			self:croptop( crop[1] ):cropbottom( crop[2] )
			self:cropleft( crop[3] ):cropright( crop[4] )

		end,

		SplitCommand=function(self)

			local pos = pos[i]		pos = { x = pos[1], y = pos[2] }
			local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()
			local t = 4 * self:getTweenRate()

			local x = self:GetX() + w * 0.5 * pos.x
			local y = self:GetY() + h * 0.5 * pos.y
			
			if not p.Backwards then self:linear(t):xy( x, y )
			else self:xy( x, y ):linear(t):Center() end

		end

	} }

end

return t