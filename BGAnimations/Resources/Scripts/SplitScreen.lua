local params = ...

params.Sleep = params.Sleep or 4
params.Zoom = params.Zoom or 1
params.FrmDelay = params.FrmDelay or 1
params.Alphas = params.Alphas or { 1 }

local bpm = GAMESTATE:GetSongBPS() * 60
if bpm > 200 then
	params.Sleep = params.Sleep * math.floor( bpm * 0.01 )
end

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local crops = {
	{ 0, 0.5, 0, 0.5, -1, -1 },
	{ 0, 0.5, 0.5, 0, 1, -1 },
	{ 0.5, 0, 0, 0.5, -1, 1 },
	{ 0.5, 0, 0.5, 0, 1, 1 }
}

-- Static Background with alphas

local tbl
for _,v in ipairs( params.Alphas ) do
	tbl = {}
	tbl.BGMirror = true
	tbl.Commands = "Mirror"
	tbl.File = params.File[v]
	local s = "/BGAnimations/Resources/Scripts/TileTool.lua"
	t[#t+1] = loadfile( s )( tbl )
end

local function AddNSub(val)

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

		self:effectclock("beat")
		self:set_tween_uses_effect_delta(true)

		self:Load(params.File[c])
		BGA_G.Details( self, params )

		self:Center()
		self:sleep( params.Sleep )
		c = AddNSub(c)
		self:queuecommand("On")

	end
}

-- Split

for i=1,4 do

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)

			self:stoptweening()
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)

			BGA_G.ScreenPreview(self)
			self:sleep( params.Sleep )
			if i == 1 then
				c2 = AddNSub(c2)
			end
			self:queuecommand("On")

		end,

		Def.Sprite{
			OnCommand=function(self)

				self:stoptweening()
			 	self:effectclock("beat")
			 	self:set_tween_uses_effect_delta(true)

				self:Load(params.File[c2])
				BGA_G.Details( self, params )

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

				self:finishtweening()
				if not params.Dir then
					self:Center():linear(4)
					self:x( self:GetX() + w * 0.5 * crops[i][5] )
					self:y( self:GetY() + h * 0.5 * crops[i][6] )
				else
					self:x( self:GetX() + w * 0.5 * crops[i][5] )
					self:y( self:GetY() + h * 0.5 * crops[i][6] )
					self:linear(4):Center()						
				end

			end
		}

	}

end

local s = "/BGAnimations/Resources/Scripts/TileTool.lua"
for i=-1,1 do
	if i ~= 0 then
		local tbla = {}
		DeepCopy(tbl,tbla)
		tbla.X_pos = i
		tbla.Commands = "Rotation"
		tbla.Rot = { 0, 180, 0 }
		t[#t+1] = loadfile( s )( tbla )
	end
end

if params.Remove then
	t = nil
end

return Def.ActorFrame{ t }