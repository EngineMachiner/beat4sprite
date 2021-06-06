
BGA_G = {
	NoteSync = true
	--[[ If set to false the default speed note 
		doesn't sync with the background movement
		in most of cases. ]]
}

local a = BGA_G

local function IDest_Quad()
	return Def.Quad{
		OnCommand=function(self)
			self:blend("BlendMode_InvertDest")
			self:FullScreen()
			self:Center()
		end
	}
end
a.IDest_Quad = IDest_Quad


-- Sprite initial state
local function InitState( self, tbl )

	local i, j = tbl[1], tbl[2]
	local n = self:GetNumStates()

	local function Check(s)

		local p = s
		while p < n - 1 do 
			p = p + n
		end

		while p > n - 1 do 
			p = p - n
		end

		return p

	end

	local s = self:GetState()

	s = s + i
	s = Check(s)

	s = s + j
	s = Check(s)

	return s

end
a.InitState = InitState

local function ScreenPreview(self, params)

	local scrn = SCREENMAN:GetTopScreen()
	scrn = scrn and scrn:GetName()

	if scrn then

		local s = string.match(scrn, "MenuBackgroundChange")
		if scrn == "ScreenEdit"
		and SCREENMAN:GetTopScreen():GetEditState() == "EditState_Edit" then 
			s = true
		end

		if s then

			self:effectclock("timer")
			self:set_tween_uses_effect_delta(false)

			if string.match(tostring(self),"Sprite") then
				self:set_use_effect_clock_for_texcoords(false)
				local n = self:GetNumStates()
				if n > 1 then
					self:SetAllStateDelays(params.FrmDelay/n)
				end
			end

			if BGA_G.IsCmd( params, "Rainbow" ) then
				if self.UniqueEffect then
					self:effectperiod(8)
				else
					self:GetParent():addcommand("ResetRainbow", function(p)
						p:stoptweening()
						p:effectperiod(8)
					end)
					self:GetParent():sleep(0):queuecommand("ResetRainbow")
				end
			end

			self:hurrytweening(0.25)

		end

	end

end
a.ScreenPreview = ScreenPreview


local function GetDelay(self, params)

	params = params or {}
	local s = self

	local count = 0
	while string.match(tostring(s),"ActorFrame")
	and count < 5 do
		s = s:GetChild("")
		count = count + 1
	end

	local p = params
	local d = p.FrmDelay or 1

	local n = p.Class == "Quad" and 1 
	n = n or s:GetNumStates()
	
	local bpm = GAMESTATE:GetSongBPS() * 60
	if bpm > 200
	and not p.NoDelayTweaking then
		d = d * math.floor( bpm * 0.01 ) * 0.5
	end

	--SCREENMAN:SystemMessage(DBG_E.ConcatTable({ d / n, d }))
	return { d / n, d }

end
a.GetDelay = GetDelay


-- // -- // --

local function ParToCmd(params, cmds, s_tbl)

	local p, t = params, cmds -- tables
	local s = s_tbl 
	
	if type(s) == "string" then
		s = { 
			Index = s, 
			CmdString = s
		}
	end

	local c
	local a = #t == 0 and 1 or #t
	for i=1,a do
		if p[s.Index] and t[i] == s.CmdString then 
			c = true
		end
		if i == a and not c
		and p[s.Index] then
			t[#t+1] = s.CmdString
		end
	end

	return t

end

local function DefPar( params )

	local p = params

	p.Zoom = p.Zoom or 1

	p.Frame_i = p.Frame_i or 1
	p.Frame_l = p.Frame_l or p.Frame_i
	
	p.Frames = p.Frames or { p.Frame_i, p.Frame_l }
	local t = p.Frames
	if type(t) == "table" then
		for i=1,#t do
			if not p.Frames["Check"] then
				t[i] = t[i] - 1
			end
		end
	else
		t = { t - 1, t - 1 }
	end
	p.Frames = t
	
	p.Frames["Check"] = true
	p.Frames = t

	p.Frame_i, p.Frame_l = nil
	p.FrmDelay = p.Delay or p.FrmDelay
	p.FrmDelay = p.FrmDelay or 1
	p.FrmDelay = p.Class == "Quad" and 1 or p.FrmDelay
	
	p.FrmDelay = p.StopAtFrame and p.FrmDelay / p.StopAtFrame or p.FrmDelay 
	p.Delay = nil

	p.Mirror = p.BGMirror and { 1, 0 } or p.Mirror
	p.BGMirror = nil
	
	if p.File
	and string.match(p.File,"1st") then
		p.FrmDelay = p.FrmDelay * 2
	end

	p.HurryTweenBy = p.Speed or p.HurryTweenBy
	p.HurryTweenBy = p.HurryTweenBy or 1
	p.Speed = nil

	local s = p.Spacing
	s = type(s) == "number" and { 1 + s, 1 + s } or s
	s = s or { 1, 1 }
	p.Spacing = s

	local x = p.X_num or 0
	x = type(x) == "number" and { -math.abs(x), math.abs(x) } or x
	p.X_num = x

	local y = p.Y_num or 0
	y = type(y) == "number" and { -math.abs(y), math.abs(y) } or y
	p.Y_num = y

	p.X_pos = p.X_pos or 0
	p.Y_pos = p.Y_pos or 0

	p.X_coord = p.X_coord or 0
	p.Y_coord = p.Y_coord or 0
	p.TCV = p.TCV or { p.X_coord, p.Y_coord }
	p.X_coord, p.Y_coord = nil

	local b = p.TCV
	local c = 0

	for i=1,#b do
		c = c + ( b[i] ) ^ 2
	end
	c = math.sqrt(c)

	for i=1,#b do
		b[i] = b[i] ~= 0 and b[i] / math.abs(b[i]) or 0
	end

	if not p.HTBCheck then
		p.HurryTweenBy = c > 1 and p.HurryTweenBy * c * 2 or p.HurryTweenBy
		p.HTBCheck = true
	end

	for i=1,#b do
		c = b[i] ~= 0 and true
		if c then break end
	end

	p.TCV = b
	
	-- Sort queueing tweens first and the rest later

	-- First commands are ran first
	local bl = {
		"Move"
	}

	t = {}
	if type(p.Commands) == "string" then
		t[#t+1] = p.Commands
	elseif type(p.Commands) == "table" then
		t = p.Commands
	end

	for i=1,#t do

		-- Convert command to parameter
		if t[i] == "RandomStates" then 
			t[i] = nil
			p.RandomInitState = true
		end

		local s = t[i] and string.match(t[i],"Cross%d")
		if s then 
			t[i] = nil
			s = string.match(s,"%d")
			p.CType = tonumber(s)
		end

		-- Put blacklisted commands at the end
		-- So they begin after everything else
		for j=1,#bl do
			if i ~= #t then
				if t[i] == bl[j] then
					t[#t+1] = t[i]
					t[i] = nil
				end
			end
		end	

	end

	if p.TCV[1] ~= 0 or p.TCV[2] ~= 0 then
		t = ParToCmd(p, t, { Index = "TCV", CmdString = "Move" })
	end
	
	t = ParToCmd(p, t, "Blend")

	if p.Alpha == true then
		t = ParToCmd(p, t, "Alpha")
	end
	
	t = ParToCmd(p, t, "Mirror")
	t = type(p.Color) == "table" and ParToCmd(p, t, "Color") or t
	
	t = ParToCmd(p, t, {
		Index = "Rot",
		CmdString = "Rotation"
	})

	p.Commands = t

	p.Class = p.Class or "Sprite"

	if p.File then
		local n = string.match( p.File, "%dx%d" )
		if n then
			n = { n:sub(1,1), n:sub(3,3) }
			for i=1,#n do
				n[i] = tonumber(n[i])
			end
			p.Sheet = n
		end
	end

	if BGA_G.IsCmd( p, "Mirror" )
	and not p.Mirror then
		p.Mirror = { 1, 1 }
	end

	if p.Color
	and type(p.Color[1]) == "number" then
		p.Color = { p.Color }
	elseif p.Color == "Rainbow" then
		t[#t+1] = "Rainbow"
	end

	if p.Color2 then
		p.Color[2] = p.Color[2]
	end
	p.Color2 = nil

end
a.DefPar = DefPar


-- // -- // --

local function IsCmd( params, s )
	local c = params and params.Commands or {}
	for i=1,#c do
		if c[i] == s then
			return true
		end
	end
end
a.IsCmd = IsCmd 

local function Tile( frame, params )

	if not params.Remove then

		local f, p = frame, params

		if #p > 1 and p[1]["Index"] then

			for k,v in pairs( p ) do
				Tile(f, v)
			end

		else
		
			local s = "/BGAnimations/Resources/Scripts/TileTool.lua"

			local t = p.File
			if type(t) == "table" then

				if p.TCV then
					p.X_pos = p.TCV[1] * 0.75 / math.abs(p.TCV[1])  
				end

				f[#f+1] = Def.ActorFrame{}
				f = f[#f]

				-- Yes this is checked twice ( here and in DefPar )
				p.Mirror = p.BGMirror and { 1, 0 } or p.Mirror
				p.BGMirror = nil

				local v = { 0, false }
				for i=#t*2+1,1,-1 do

					if p.Mirror 
					and p.Mirror[1] ~= 0 then

						v[1] = v[1] + 1

						if v[1] >= #t then
							v[2] = not v[2]
							v[1] = 0
						end

					end

					local pcopy = {}

					DeepCopy(p, pcopy)
					
					pcopy.MultipleFiles = { i, #t }

					while i > #t do
						i = i - #t
					end

					local val = i
					
					if v[2] then

						if pcopy.Rot then
							pcopy.Rot[2] = pcopy.Rot[2] - 180
						else
							pcopy.Rot = { 0, 180, 0 }
						end

						val = #t + 1 - i

					end 

					pcopy.File = t[val]

					f[#f+1] = loadfile(s)(pcopy)

				end

			elseif type(t) == "string" then

				f[#f+1] = loadfile(s)(p)

			end

			if p.Actors then
				for k,v in pairs(p.Actors) do
					f[#f+1] = v
				end
			end

		end

	end

end
a.Tile = Tile

local function Scale( self, params )

	local t = self:GetTexture()
	if not t then 
		self:Load( THEME:GetPathG("","_blank") )
	end

	-- Theme scale 
	local scl = SCREEN_HEIGHT / 480

	-- Image scale
	local h = t:GetSourceHeight()
	scl = scl * ( 480 / h )

	self:zoom( scl * params.Zoom )

end
a.Scale = Scale


local function Update(self, params)

	local scrn = SCREENMAN:GetTopScreen()
	scrn = scrn and scrn:GetName()

	if scrn then

		local s = string.match(scrn, "ScreenGameplay")
		if scrn == "ScreenEdit"
		and SCREENMAN:GetTopScreen():GetEditState() == "EditState_Playing" then 
			s = true
		end
		
		if s then
			
			local n = self:GetNumStates()

			if n > 1 then
				local d = GetDelay(self, params)[1]
				self:SetAllStateDelays(d)
			end
			
			if BGA_G.IsCmd( params, "Rainbow" ) then
				local n = BGA_G.GetDelay(self, params)[2]
				if self.UniqueEffect then
					self:effectperiod( 16 * n )
				else
					self:GetParent():effectperiod( 16 * n )
				end
			end

		else

			if self.IDelay then
				self:SetAllStateDelays(self.IDelay)
			end
			
		end

	end

end

local function Details( self, params )

	self:SetTextureFiltering(false)
	self:set_use_effect_clock_for_texcoords(true)

	local p = params
	Scale( self, p )
	ScreenPreview( self, params )

	local n = self:GetNumStates()
	local s = p.RandomInitState and math.random( 0, n - 1 )
	s = s or 0
	self:setstate(s)

	self:GetParent():SetUpdateFunction( function()
		Update( self, p )
	end)

end
a.Details = Details


-- Parameter whitelist
local wl = {

	"ID",
	"Index",
	"Cleanup",
	"Actors"

}

local function ParTweak( params, tweaks ) 

	local p, t = params, tweaks

	if t then

		if t.Index then

			if p.Index == t.Index then

				if t.Cleanup then
					for k,v in pairs(p) do
						for i=1,#wl do
							if k ~= wl[i] then
								p[k] = nil
							end
						end
					end
				end

				-- Additional Actors
				if t.Actors then
					t.Actors = t.Actors["Class"] and { t.Actors } or t.Actors
					p.Actors = p.Actors or {}
				end

				p.Frames = nil

				--[[
					Do not delete values or arrays 
					while iterating the same table 
				]]	

				-- Add tweaks
				for k,v in pairs(t) do
					p[k] = v
				end

			end
		end

		-- Tweaking through more and indexing
		if #t > 0 then
			for i=1, #t do 
				if type(t[i]) == "table" then
					ParTweak( p, t[i] )
				end
			end
		end

		if #p > 0 then
			for i=1, #p do 
				if type(p[i]) == "table" then 
					ParTweak( p[i], t )
				end
			end
		end

	end

end
a.ParTweak = ParTweak


local function SetStates( self, params )

	local t, p = {}, params

	local a, b = p.Frames[1], p.Frames[2]
	
	if a >= 0 then
		if b > a then
			for i=a,b do
				t[#t+1] = { Frame = i }
			end
		elseif b < a then
			for i=a,b,-1 do
				t[#t+1] = { Frame = i }
			end
		else
			t[#t+1] = { Frame = b }
		end
	end

	local n = p.Sheet
	if n then
		if p.Frames["Type"] == 1 then

			local t2 = {}

			self.matrix = self.matrix or { 1, n[2] }
			local total = self.matrix[1] + self.matrix[2]
			self.ns = self.ns or self:GetNumStates()
			total = total * n[1] + 1
			while total > self.ns do
				total = total - self.ns
			end
			while total < 1 do
				total = total + self.ns
			end

			for i=1,n[1]-1 do
				t2[#t2+1] = t[i+total]
			end

			t = t2

		elseif p.Frames["Type"] == 2 then

			local t2 = {}

			self.ns = self.ns or self:GetNumStates()
			p.FrmDelay = 4 / n[1]

			for i=1,#t,n[1] do

				local total = i + self.matrix[1] - math.ceil(n[1]*0.5)
				while total > self.ns do
					total = total - self.ns
				end
				while total < 1 do
					total = total + self.ns
				end

				t2[#t2+1] = t[total]

			end

			t = t2

		end
	end

	t = p.CustomFrames or t

	if not p.Texture then
		self:SetStateProperties(t)
	end
	
	if self:GetNumStates() == 1 then
		p.FrmDelay = 1
	end

	Details( self, p )

end
a.SetStates = SetStates


local function PlayCmds( self, params )

	local p = params
	local c = p.Commands

	for i=1,#c do
		local v = c[i]
		if v == nil then
			table.remove(c,i)
		else
			self:queuecommand(v)
		end
	end

end
a.PlayCmds = PlayCmds


local function Stop( self, visible )
	if visible then
		self:diffusealpha(1)
	else
		self:stoptweening()
		self:stopeffect()
		self:diffusealpha(0)
		self:blend("BlendMode_Normal")
		self:zwrite(false):ztest(false)		
		self:RunCommandsOnChildren(function(c)
			c:blend("BlendMode_Normal")
			c:stoptweening()
			c:stopeffect()
			c:animate(false)
		end)
	end
end
a.Stop = Stop

local function ZShade( self, tbl )

	local c = { 
		tbl.zpos[2],
		tbl.zpos[1]
	}

	for i=1,#c do
		c[i] = math.abs(c[i])
		c[i] = c[i] * 0.001
		if c[i] < 0.25 then 
			c[i] = 0.25
		end 
		c[i] = tostring(c[i])
	end

	local function concat(v)
		local c = v
		for i=1,2 do
			c = c .. v
		end
		return c
	end

	local color1 = concat( c[1].."," ) .. "1"
	local color2 = concat( c[2].."," ) .. "1"

	self:stoptweening()
	self:diffuse( color( color1 ) )
	self:linear( tbl.t * BGA_G.GetDelay(self)[2] )
	self:diffuse( color( color2 ) )

end
a.ZShade = ZShade
