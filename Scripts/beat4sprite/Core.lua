
-- Reminder all sprites created with a loop should have their
-- own ActorFrame to get proper delay animation control
-- (tfw I forgot about this and lost a day debugging)

BGA_G = {
	RPath = "/BGAnimations/Resources/",
	SPath = "/BGAnimations/Resources/Scripts/",
	GPath = "/BGAnimations/Resources/Graphics/",
	BPath = function(s, file)
		local s2 = file or "default.lua"
		s2 = "/" .. s2
		return "/BGAnimations/" .. s .. s2
	end,
	SongBGPath = function()
		local s = GAMESTATE:GetCurrentSong()
		return s:GetBackgroundPath()
	end,
	NoteSync = true
	--[[ If set to false the default speed note 
		doesn't sync with the background movement
		in most of cases. ]]
}

BGA_G.bitEyeFix = function(self, f)
	if BGA_G.IsScreenAvailable("Preview") and bitEye then
		local scale = self.bitEyeScale or 0.5
		bitEye.Scale(self, scale)		if f then f(self) end
	end
end

-- Creates a quad with inverted blend
local function IDest_Quad()
	return Def.Quad{
		OnCommand=function(self)
			self:blend("BlendMode_InvertDest")
			self:FullScreen()
			self:Center()
		end
	}
end

-- Sprite initial state algorithm
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

local function IsScreenAvailable(par_name)

	local scrn = SCREENMAN:GetTopScreen()
	local name = scrn and scrn:GetName()

	if scrn then

		local tbl = {

			Preview = function()
				if name == "ScreenEdit"
				and scrn:GetEditState() == "EditState_Edit" then
					return true
				end

				if name:match("MenuBackgroundChange") then 
					return true
				end
			end,

			Gameplay = function()
				if name == "ScreenEdit"
				and scrn:GetEditState() == "EditState_Playing" then
					return true
				end

				if name == "ScreenGameplay" then 
					return true
				end
			end

		}

		return tbl[par_name]() or false

	end
	
	return false

end

local function ScreenPreview(self, params)

	if IsScreenAvailable("Preview") then

		if tostring(self):match("Sprite ") then
			local n = self:GetNumStates()
			if n > 1 then
				local d = params.FrmDelay / n
				self:SetAllStateDelays(d)
			end
		end

		if params:IsCmd("Rainbow") then
			if self.UniqueEffect then
				self:effectperiod(8)
			else
				local p = self:GetParent()
				local s = "ResetRainbow"
				if not p.ResetRainbow then
					p:addcommand(s, function()
						p:stoptweening()
						p:effectperiod(8)
					end)
					p.ResetRainbow = true
				end
				-- sleep(0) because of the tween stack?
				p:sleep(0):queuecommand(s)
			end
		end

		self:hurrytweening(0.25)

	end

end


local function GetDelay(self, i, params)

	local s = self
	local p = params or BGA_G.Create( {} )
	local d = p.FrmDelay * p.InternalDelay

	local bpm = GAMESTATE:GetSongBPS() * 60
	if bpm > 200 then
		d = d * math.floor( bpm * 0.01 ) * 0.5
	end

	if tostring(s):match("ActorFrame") then
		return d
	end

	local n = p.Class == "Quad" and 1
	n = n or s:GetNumStates()
	if n == 0 then n = 1 end

	if not i then i = 1 end

	return ( { d, d / n } )[i]

end

-- // -- // --

-- Send parameters to the commands table
local function ParToCmd(params, cmds, s_tbl)

	local p, t = params, cmds -- tables
	local s = s_tbl 
	
	-- Make it readable if it's just one string
	if type(s) == "string" then
		s = { Index = s,	CmdString = s }
	end

	local pTwo = { Commands = cmds }
	if p[s.Index] and not p.IsCmd( pTwo, s.CmdString ) then
		t[#t+1] = s.CmdString
	end
	
	return t

end

local function FileCheck( v )

	if not v then return false end
	
	if not v:match("BGAnimations/")
	and not v:match("Songs/")
	and not v:match("Themes/") then
		return true
	end

	return false

end

-- Default parameters logic
local function DefPar( params )

	local p = params

	if not p.Frame_i and p.Frame_l then
		p.Frame_i = 1
	end

	p.Frame_l = p.Frame_l or p.Frame_i

	if p.Frame_i and p.Frame_l then
		p.Frames = { p.Frame_i, p.Frame_l }
	end

	p.Frame_i, p.Frame_l = nil

	local t = p.Frames
	if t and not p.Config.Frames then
		if type(t) == "table" then
			for i=1,#t do
				if t[i] > 0 then t[i] = t[i] - 1 end
			end
		else
			t = { t - 1, t - 1 }
		end
		p.Frames = t
		p.Config.Frames = true
	end

	if p.FrameReverse then
		p.Frames.Type = "Reversed"
		p.FrameReverse = nil
	end

	p.FrmDelay = p.Delay or p.FrmDelay
	p.Delay = nil

	p.FrmDelay = p.Class == "Quad" and 1 or p.FrmDelay
	
	local d = p.FrmDelay
	if d and p.StopAtFrame and not p.Config.SAFDelay then
		p.Config.SAFDelay = true
		p.FrmDelay = d / p.StopAtFrame
	end

	if p.File then

		if type(p.File) == "string" then

			local n = p.File:match("%dx%d")
			if n then
				n = { n:sub(1,1), n:sub(3,3) }
				for i=1,#n do n[i] = tonumber(n[i]) end
				p.Sheet = n
			end

			p.File = { p.File }

		end

		for i=1,#p.File do
			if d and p.File[i]:match("1st/")
			and not p.Config["1stDelay"] then
				p.FrmDelay = d * 2
				p.Config["1stDelay"] = true
				break
			end
		end
			
		for i=1,#p.File do
			if FileCheck( p.File[i] ) then
				p.File[i] = BGA_G.GPath .. p.File[i]
			end
		end

		if #p.File == 1 then p.File = p.File[1] end

	end

	if p.Script and not p.Script:match( BGA_G.SPath )
	and not p.Script:match( "default.lua" ) then
		p.Script = BGA_G.SPath .. p.Script
	end

	if p.ResetParams then
		p.Cleanup = true	p.ResetParams = nil
	end

	p.Mirror = p.BGMirror and { 1, 0 } or p.Mirror
	p.BGMirror = nil

	p.HurryTweenBy = p.Speed or p.HurryTweenBy
	p.Speed = nil

	local s = p.Spacing
	if s and type(s) == "number" then
		p.Spacing = { 1 + s, 1 + s }
	end

	local x = p.X_num
	if x and type(x) == "number" then
		p.X_num = { - math.abs(x), math.abs(x) }
	end

	local y = p.Y_num
	if y and type(y) == "number" then
		p.Y_num = { - math.abs(y), math.abs(y) }
	end

	if p.X_coord or p.Y_coord then

		if not p.TCV or p.TCV[1] == p.TCV[2] then

			p.X_coord = p.X_coord or 0
			p.Y_coord = p.Y_coord or 0

			p.TCV = { p.X_coord, p.Y_coord }
			
			p.X_coord, p.Y_coord = nil

		end

	end

	local b = p.TCV

	if b then

		local c = 0

		for i=1,#b do c = c + ( b[i] ) ^ 2 end
		c = math.sqrt(c)

		for i=1,#b do
			b[i] = b[i] ~= 0 and b[i] / math.abs(b[i]) or 0
		end

		local ht = p.HurryTweenBy
		if c > 1 and not p.Config.HTB and ht then
			ht = ht * c * 2
			p.Config.HTB = true
			p.HurryTweenBy = ht
		end
		
		p.TCV = b
		
	end

	-- Blacklisted commands are run after
	local bl = { "Move" }

	local t = {}
	if type(p.Commands) == "string" then t[#t+1] = p.Commands
	elseif type(p.Commands) == "table" then t = p.Commands
	end

	for i=1,#t do

		-- Convert command to parameter
		if t[i] == "RandomStates" then 
			t[i] = nil	p.RandomInitState = true
		end

		-- Cross old parameter converter
		local s = t[i] and t[i]:match("Cross%d")
		if s then 
			t[i] = nil		s = s:match("%d")
			p.CrossType = tonumber(s)
		end

		-- Put blacklisted commands at the end
		for j=1,#bl do
			if i ~= #t and t[i] == bl[j] then
				t[#t+1] = t[i]	  t[i] = nil
			end
		end	

	end

	if p.TCV and ( p.TCV[1] ~= 0 or p.TCV[2] ~= 0 ) then
		t = ParToCmd(p, t, { 
			Index = "TCV", CmdString = "Move" 
		} )
	end

	t = ParToCmd(p, t, "Blend")
	t = ParToCmd(p, t, "Alpha")
	t = ParToCmd(p, t, "Cross")
	t = ParToCmd(p, t, "Shade")
	t = ParToCmd(p, t, "Fade")
	t = ParToCmd(p, t, "Mirror")
	t = ParToCmd(p, t, "ZoomXYZ")

	t = ParToCmd(p, t, {
		Index = "Rot",
		CmdString = "Rotation"
	})

	t = ParToCmd(p, t, {
		Index = "State",
		CmdString = "FramePerSprite"
	})

	if p.Color and type(p.Color[1]) == "number" then
		p.Color = { p.Color }
		t = ParToCmd(p, t, "Color")
	elseif p.Color == "Rainbow" and not p:IsCmd("Rainbow") then
		t[#t+1] = "Rainbow"
	end

	if p.Color2 then p.Color[2] = p.Color2 end
	p.Color2 = nil

	if #t == 0 then t = nil end
	p.Commands = t

	if p.Mirror == true
	or p:IsCmd( "Mirror" ) and not p.Mirror then
		p.Mirror = { 1, 1 }
	end

	if p.Blend == true 
	or p:IsCmd( "Blend" ) and not p.Blend then 
		p.Blend = "BlendMode_Modulate" 
	end

	if p:IsCmd( "Fade" ) then
		if p.Fade == true then p.Fade = nil end
		p.Fade = p.Fade or { 1, 1 }
		p.FadePeriodBy = p.FadePeriodBy or 1
	end

end

-- // -- // --

local function IsCmd( params, s )
	local c = params and params.Commands or {}
	for i=1,#c do
		if c[i] == s then return true end
	end
	return false
end

local def = {
	Zoom = 1,	Frames = 1,
	X_num = 0,	Y_num = 0,	Spacing = { 1, 1 },
	TCV = { 0, 0 },
	FrmDelay = 1,	InternalDelay = 1,
	HurryTweenBy = 1,	Config = {},
	X_pos = 0,	Y_pos = 0,	Class = "Sprite",
	Script = BGA_G.SPath .. "TileTool.lua",
	IsCmd = IsCmd, 	DefPar = DefPar
}
if type(def.Y_num) ~= "table" then DefPar(def) end

-- Algorithm that reads parameters and sets them according to the AF.
local function Add(params, frame)

	local p, f = params, frame
	if not p then return end

	if not p.Remove then
		
		if #p > 0 and not p.FileTweak then

			for i=1,#p do
				if type(p[i]) == "table" then Add(p[i], f) end
			end

		else

			if type(p.File) == "table"
			and not p.LoadOnce then

				local t = p.File

				-- Loads a script per file

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

					local pcopy = p:Copy()

					pcopy.MultipleFiles = { i, #t }

					while i > #t do i = i - #t end

					local val = i
						
					if v[2] then

						if pcopy.Rot then
							pcopy.Rot[2] = pcopy.Rot[2] - 180
						else
							pcopy.Rot = { 0, 180, 0 }
						end

						val = #t + 1 - i

					end 

					pcopy.File = tostring(t[val])

					DefPar(pcopy)
					Add( pcopy, frame )

				end

			else

				if p.Actors and p.Actors.Class then
					p.Actors = { p.Actors }
				end
	
				-- Back Actors
				if p.Actors and not p.LoadOnce then
					for k,v in pairs(p.Actors) do
						if v.AtBack then
							f[#f+1] = v
						end
					end
				end

				if not p.Script and not p.FileTweak then
					assert(p.Script, "Script is nil!")
					return
				end

				local sOnce = p.FileTweak
				if ( p.File and p.Script ) or sOnce then
					local script = sOnce or p.Script
					if sOnce then p.FileTweak = nil end
					f[#f+1] = loadfile(script)(p)
				end

				-- Front Actors
				if p.Actors and not p.LoadOnce then
					for k,v in pairs(p.Actors) do
						if not v.AtBack then
							f[#f+1] = v
						end
					end
				end

			end

		end

	end

end

-- Parameter whitelist (won't be deleted on Cleanup)
local wl = { "Actors", "Config" }

local function Iterate( p, t )

	if p.Index and t.Index
	and t.Index == p.Index then

		if not t.IsCmd then t.IsCmd = IsCmd end
		if not p.IsCmd then p.IsCmd = IsCmd end

		if not t.Config then t.Config = {} end
		if not p.Config then p.Config = {} end

		DefPar(t)		DefPar(p)
		
		local hasKeys
		for k,v in pairs(t.Config) do
			if type(k) == "string" then
				hasKeys = true		break
			end
		end

		if not hasKeys then t.Config = nil end

		if t.Cleanup then
			if not p.Cleanup then
				t.Cleanup = nil
			end
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
			local a = t.Actors.Class
			t.Actors = a and { t.Actors } or t.Actors
			p.Actors = p.Actors or {}
		end

		-- Add tweaks

		if t.Config then
			p.Config = t.Config
		end

		for k,v in pairs(t) do
			if k ~= "Index" then p[k] = v end 
		end

		p.Index = nil

		DefPar(p)

	end

end

-- Change / Pass parameters
local function ParTweak( params, tweaks ) 

	if not tweaks then return end
	
	local p, t = params, tweaks

	if #p == 0 then p = { p } end
	if #t == 0 then t = { t } end

	for i=1, #t do t[i].Index = t[i].Index or i end
	for i=1, #p do p[i].Index = p[i].Index or i end

	for i=1, #p do
		for j=1, #t do
			if type(p[i]) == "table"
			and type(t[j]) == "table" then
				Iterate( p[i], t[j] )
			end
		end
	end

	if #p == 1 then p = p[1] end
	if #t == 1 then t = t[1] end

end
def.ParTweak = ParTweak


local function Meta(p)
	
	p.Config = {}

	if #p == 0 then
		-- Constant default values
		setmetatable( p, { __index = def } )
		DefPar(p)
	end

	for i=1,#p do
		if type(p[i]) == "table" then Meta(p[i]) end
	end

end

local function Create( params )

	if not params.Config then
		Meta(params)
		params.Copy = def.Copy
		params.Load = def.Load
		params.ParTweak = def.ParTweak
	end

	return params

end

-- Load is the main function to create any set.
local function Load( params, frame )
	
	-- Optional p as parent
	local p = frame or BGA_G.Frame()

	-- Do not set default parameters 
	--	if we already have a base script
	if not params.FileTweak then
		params = Create( params )
	end

	Add(params, p)

	return p

end
BGA_G.Load = Load
def.Load = Load

local function Scale( self, params )

	local t = self:GetTexture()
	if not t then 
		self:Load( THEME:GetPathG("","_blank") )
	end

	-- Theme scale 
	local scl = SCREEN_HEIGHT / 480

	-- Image scale
	local h = t and t:GetSourceHeight() or 480
	scl = scl * ( 480 / h )

	self:zoom( scl * params.Zoom )

end

-- UpdateFunction related
-- Optimized to only update on change (not every frame)

local function GetRandomColor()

	local s = ""
	for i=1,3 do
		local n = math.random(0,255) / 255
		n = tostring(n)		s = s .. n .. ", "
	end
	
	return color(s)

end

local function Update(self, params)

	local data = self.UpdateData

	if params.Color == "RainbowFlash" then

		-- Hybrid Clock
		data.Delta = data.Delta or 2

		local d = self:GetEffectDelta()
		local change = data.Delta
		local lim = 0.5

		change = change > lim and lim ~= 0

		if change then data.Delta = 0 end

		if data.Delta < lim and lim ~= 0 then
			data.Delta = data.Delta + d
		end

		local s = self
		if not params.Script:match("TileTool.lua") then
			s = self:GetParent()
		end
		
		if change then s:diffuse( GetRandomColor() ) end

	end

	if params.Class ~= "Sprite" then return end

	local n = self:GetNumStates()
	if IsScreenAvailable("Gameplay") then

		if n > 1 then

			local id = self.IDelay or 1
			local d = self:GetDelay(2, params) * id
			local dataSD = data.StateDelay

			if not dataSD or dataSD ~= d then
				self:SetAllStateDelays(d)
				data.StateDelay = d
			end

		end

		if params:IsCmd( "Rainbow" ) then

			local n = self:GetDelay(2, params)
			local dataRP = data.RainbowPeriod

			if not dataRP or dataRP ~= n then

				if not self.UniqueEffect then
					-- Not TileTool.lua
					self:GetParent():effectperiod( 16 * n )
				end
				data.RainbowPeriod = n

			end
			
		end

	else

		if self.IDelay ~= data.IDelay then
			self:SetAllStateDelays( self.IDelay / n )
			data.IDelay = self.IDelay
		end
			
	end

end

-- Sprite details to be set
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

	if self.Name ~= "Sample" or not self.Name then
		self.UpdateData = {}
		self:GetParent():SetUpdateFunction( function()
			Update( self, p )
		end)
	end

end

-- Sprite frames stuff
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

		self.ns = self.ns or self:GetNumStates()
		-- Animation goes horizontally only -> 5th033A
		if p.Frames.Type == "OnlyRow" then

			local t2 = {}

			self.matrix = self.matrix or { 1, n[2] }
			local total = self.matrix[1] + self.matrix[2]
			
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

		-- Animation skips a whole row per column
		elseif p.Frames.Type == "RowSkip" then

			local t2 = {}

			p.FrmDelay = 4 / n[1]

			for i=1,#t,n[1] do

				local total = i + self.matrix[1]
				total = total - math.ceil( n[1] * 0.5 )

				while total > self.ns do
					total = total - self.ns
				end
				while total < 1 do
					total = total + self.ns
				end

				t2[#t2+1] = t[total]

			end

			t = t2

		-- Animation goes on and backwards
		elseif p.Frames.Type == "Loop" then

			local t2 = {}

			local i = 0
			while i < p.Frames[2] do
				i = i + 1
				t2[#t2+1] = t[i]
			end
		
			i = self.ns
			while i > 2 do
				i = i - 1
				t2[#t2+1] = t[i]
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

-- Excecute at once
local function PlayCmds( self, params )

	local p = params
	local c = p.Commands
	if not c then return end

	for k,v in pairs(c) do
		self:queuecommand(v)
	end

end

-- Shadows depending on Z.
local function ZShade( self )

	local c = { 
		self.zpos[2],
		self.zpos[1]
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

	local p = self:GetParent():GetParent()
	self:diffuse( color( color1 ) )
	self:linear( self:GetParent():GetParent().Tween )
	self:diffuse( color( color2 ) )

end

-- Center 3D scripts and AFT texture creation overlapping
local function Center3D(self, scale)
	if IsScreenAvailable("Preview") then
		scale = scale or 0.5
		local x = - SCREEN_CENTER_X * scale
		local y = - SCREEN_CENTER_Y * scale
		self:xy( x, y ):zoom(scale)
	end
end

-- Stop behaviour
local function ResumeOrStop( self, stop )
	
	if tostring(self):match("Sprite ") then
		self:texcoordvelocity(0,0)
	end

	self:visible(false)
	if not stop then
		self:visible(true)
	end

end

local function ObjFuncs(self)

	if IsScreenAvailable("Gameplay") then
		--self:stoptweening()
		self:set_tween_uses_effect_delta(true)
		self:effectclock('beat')
	end

	self.GetFullDelay = function(self, p, i)
		return self:GetDelay(i) * p.HurryTweenBy
	end

	self.GetDelay = GetDelay
	self.PlayCmds = PlayCmds
	self.ScreenPreview = ScreenPreview
	
	local t = {

		ActorFrame = function()
			self.ResumeOrStop = ResumeOrStop
			self.Center3D = Center3D
			self.ExplodePreview = ExplodePreview
		end,

		Sprite = function()
			self.InitState = InitState
			self.SetStates = SetStates
		end

	}

	for k,v in pairs(t) do
		if tostring(self):match(k .. " ") then v() end
	end

end

-- Filter def's table parameters
local function Filter(t)

	for i=1,#t do
		if type(t[i]) == "table" then
			Filter(t[i])
		end
	end

	if #t == 0 then

		for k,v in pairs(def) do

			local val = t[k]
			if val then
				if type(v) ~= "table" then
					if val == v and k ~= "Script" then 
						t[k] = nil 
					end
				else
					if #val > 0 and #v > 0
					and val[#val] == v[#v] and val[1] == v[1] then
						t[k] = nil 
					end
				end
			end
	
		end

		if t.Config then
			if t.Config.Frames and not t.Frames then 
				t.Config.Frames = nil
			end
			if #t.Config == 0 then t.Config = nil end
		end

		setmetatable( t, { __index = def } )

	end

end

local function Copy( copy_p, paste_p )

	local new = {}
	Create( copy_p )	DeepCopy( copy_p, new )
	Filter( new )

	if #new == 1 then new = new[1] end
	if not paste_p then return new end

	local new2 = {}
	Create( paste_p )	DeepCopy( paste_p, new2 )
	Filter( new2 )		DeepCopy( new2, new )
	--SCREENMAN:SystemMessage(mindbox.ConcatTable(new))

	if #new == 1 then new = new[1] end
	return new
	
end
def.Copy = Copy

local function BGSet(p)

	if type(p) == "string" then
		p = { File = p }
	end

	local params = {
		Commands = p.Commands,
		BGMirror = true,	X_num = 1,
		Script = "TileTool.lua"
	}
	
	params = Copy( p, params )

	return params

end

local funcs = {
	IDest_Quad = IDest_Quad,
	InitState = InitState,
	IsScreenAvailable = IsScreenAvailable,
	ScreenPreview = ScreenPreview,
	GetDelay = GetDelay,
	ParTweak = ParTweak,
	DefPar = DefPar,
	IsCmd = IsCmd,
	FileCheck = FileCheck,
	Create = Create,
	Scale = Scale,
	Update = Update,
	Details = Details,
	SetStates = SetStates,
	PlayCmds = PlayCmds,
	ZShade = ZShade,
	ResumeOrStop = ResumeOrStop,
	ObjFuncs = ObjFuncs,
	Copy = Copy,
	BGSet = BGSet
}

for k,v in pairs(funcs) do BGA_G[k] = v end

BGA_G.Frame = function()
	return Def.ActorFrame{
		GainFocusCommand=function(self)
			if not self.GetDelay then ObjFuncs(self) end
			self:ResumeOrStop() 
		end,
		LoseFocusCommand=function(self) self:ResumeOrStop("Stop") end
	}
end

--[[
	This piece of comment block is to remember that there's no Lua way to 
	reset the delta clock (yet).
	See https://github.com/TeamRizu/OutFox/issues/426
]]