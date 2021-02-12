
PSX_BGA_Globals = {}
local a = PSX_BGA_Globals

--Used but not directly


--Debug function 

local function StringTable( tbl )

	local tbl_s = {}
	tbl_s["s"] = ""
	tbl_s["space"] = ""

	local function Reload( tbl )

		tbl_s["space"] = tbl_s["space"] .. "    "
		tbl_s["s"] = tostring(tbl) .. " { \n"

      	local last_i = 0
      	for k,v in pairs( tbl ) do
        	last_i = last_i + 1
      	end

    	local index = 0

	   	for k,v in pairs( tbl ) do

        	index = index + 1

		   	if type(k) ~= "number" then

		   		local key = [["]] .. k .. [["]]

		   		if type(v) ~= "table" then


		   			if last_i > 1 then
		   				if index == last_i then
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. key .. " = " .. tostring(v) .. "\n"
		   				else
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. key .. " = " .. tostring(v) .. ",\n"
		   				end
		   			else
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. key .. " = " .. tostring(v) .. "\n"
		   			end

		   		else

		   			if not string.match( k, "ctx" )
		   			and not string.match( k, "__index" ) then
		   				if index == last_i then
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. key .. " = " .. Reload( v )	
		   				else
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. key .. " = " .. Reload( v ) 
		   					tbl_s["space"] = string.sub(tbl_s["space"], 1, #tbl_s["space"]-4)
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. "},\n"
		   				end
		   			end

		   		end

		   	else

		   		local val = tostring(v)
		   		if val == "" then val = [["]] .. tostring(v) .. [["]]  end

		   		if type(v) ~= "table" then

		   			if last_i > 1 then
		   				if index == last_i then
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. val .. "\n"
		   				else
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. val .. ",\n"
		   				end
		   			else
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. val .. "\n"
		   			end

		   		else

		   			if index == last_i then
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. Reload( v ) 
		   				tbl_s["space"] = string.sub(tbl_s["space"], 1, #tbl_s["space"]-4)
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. "}\n"
		   			else
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. Reload( v ) 
		   				tbl_s["space"] = string.sub(tbl_s["space"], 1, #tbl_s["space"]-4)
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. "},\n"
		   			end

		   		end

		   	end

	    end

	    return tbl_s["s"]

	end

	return Reload( tbl ) .. "}\n"

end
a["StringTable"] = StringTable


local function BGA_ToolPreview(self)
	if SCREENMAN:GetTopScreen() then
		if SCREENMAN:GetTopScreen():GetName() == "ScreenMiniMenuBackgroundChange" then
			self:effectclock("timer")
			self:set_tween_uses_effect_delta(false)
			self:hurrytweening(0.25)
		end
	end
end
a["BGA_ToolPreview"] = BGA_ToolPreview


-- Direct Calls


local function BGA_TileTool( frame, params )
	frame[#frame+1] = LoadActor("/BGAnimations/Resources/Scripts/TileTool.lua", params)..{}
end
a["BGA_TileTool"] = BGA_TileTool


local function BGA_Scale( self, params )
	if not self:GetTexture() then 
		self:Load(THEME:GetPathG("","_blank"))
	end

	--Theme scale 
	local ScaleVar = SCREEN_HEIGHT / 480

	-- Image scale
	ScaleVar = ScaleVar * ( 480 / self:GetTexture():GetSourceHeight() )

	self:zoom( ScaleVar )
end
a["BGA_Scale"] = BGA_Scale


local function BGA_Details( self, params )

	BGA_Scale( self, params )
	self:zoom( self:GetZoom() * params.Zoom )
	
	BGA_ToolPreview(self)

	self:SetTextureFiltering(false)

	if not params.Frames then

		local c
		if type(params.Commands) == "table" then
			for k,v in pairs(params.Commands) do
				if string.match(v,"Spin")
				or string.match(v,"Move") then 
					c = true
				end
			end
		end

		local a = math.floor( GAMESTATE:GetSongBPS() * 60 * 10 / 100 ) / 10
		if a <= 1.75 or c then
			a = 1
		else
			a = 1 + GAMESTATE:GetSongBPS() * 60 / 1000
		end

		if params.NoBPMDelay then
			a = 1
		end

		if params.Delay then
			self:SetAllStateDelays(a*params.Delay)
		else
			self:SetAllStateDelays(a/self:GetNumStates())
		end

	end

	if params.Random then
		self:setstate(math.random(0,self:GetNumStates()-1))
	end

end
a["BGA_Details"] = BGA_Details


local function BGA_IQB()
	return Def.Quad{
		GainFocusCommand=function(self)
			self:blend("BlendMode_InvertDest")
			self:SetSize(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:Center()
		end
	}
end
a["BGA_IQB"] = BGA_IQB


local function BGA_ScrollTextures( frame, params )

	local X_coord, Y_coord
	local X_add, Y_add
	local Textures = params.File

	X_coord = params.X_coord
	if not X_coord then 
		X_coord = 0
		X_add = -2
	else
		X_add = 0
	end

	Y_coord = params.Y_coord
	if not Y_coord then 
		Y_coord = 0
	end

	frame[#frame+1] = Def.ActorFrame{}
	
	local count = #Textures
	for i=1,#Textures+3+X_add do 
		
		local new_params = {}

		if count > #Textures then 
			count = 1
		end

		DeepCopy(params,new_params)

		new_params.File = Textures[count]
		new_params.NumTextures = #Textures
		new_params.NumItemsX = #Textures + 3
		new_params.X_pos = ( i - 2 ) * - X_coord
		new_params.Y_pos = ( i - 1 ) * - Y_coord
		BGA_TileTool( frame[#frame], new_params )
		count = count + 1

	end
	
end
a["BGA_ScrollTextures"] = BGA_ScrollTextures


local ignore = {

	"Index",
	"ID",
	"ResetParams",
	"AddActors"

}

local function BGA_ParamsTweaks( params, tweaks ) -- These tweaks are BEFORE creating the Actor!

	if tweaks then
		
		if tweaks.Index then

			if params.Index == tweaks.Index then

				local tbl = {}
				if tweaks.ResetParams then
					for k,v in pairs( params ) do
						for i=1,#ignore do
							if k == ignore[i] then
								tbl[k] = v
							end
						end
						params[k] = nil
					end
				end

				-- Do not delete values or arrays while iterating the same table

				DeepCopy(tbl,params)		

				for k,v in pairs( tweaks ) do
					params[k] = v
				end

			end

		end

		if tweaks.AddActors and not tweaks.Index then 
			params.AddActors = tweaks.AddActors
		end

		-- More than 2 actors to tweak

		if #tweaks > 0 then
			for i=1, #tweaks do 
				if type(tweaks[i]) == "table" then 
					BGA_ParamsTweaks( params, tweaks[i] )
				end
			end
		end

		if #params > 0 then
			for i=1, #params do 
				if type(params[i]) == "table" then 
					BGA_ParamsTweaks( params[i], tweaks )
				end
			end
		end

	end

end
a["BGA_ParamsTweaks"] = BGA_ParamsTweaks


local function BGA_PostSpawn( frame, params, tweaks ) -- These tweaks are AFTER creating the Actor!

	-- The only tweak for now is for removing the actor

	-- One actor only

	if tweaks then

		if params.Index == tweaks.Index then
			if tweaks.Remove then
				frame[params.ID] = nil
			end
		end

		-- More than 2 actors

		if #tweaks > 0 then
			for i=1, #tweaks do 
				if type(tweaks[i]) == "table" then 
					BGA_PostSpawn( frame, params, tweaks[i] )
				end
			end
		end

	end


end
a["BGA_PostSpawn"] = BGA_PostSpawn


local function BGA_NoParams( params )

	local function Replace(val, add)
		local v = val
		v = v and v + add or 0
		return v
	end

	if params then

		params.Zoom = params.Zoom or 1
		
		params.Frame_i = Replace(params.Frame_i, -1)

		local l = params.Frame_l
		l = l and Replace(l, -1) or params.Frame_i
		params.Frame_l = l

		params.FDelay = params.FDelay or 2

		local s = params.Spacing
		s = type(s) == "number" and { 1 + s, 1 + s } or s or { 1, 1 }
		params.Spacing = s

		if params.Script and string.match( params.Script, "SpiralTrace" )
		and string.match( params.Script, "1st" ) then 

			params.InitZ = params.InitZ or 50
			params.Slices = params.Slices or 6
			params.Dir = params.Dir == "Out" and { -200, 50, 1 } or { 50, -200, -1 }
			params.Clockwise = params.Clockwise and 1 or -1
			params.RSpeed = params.RSpeed or 1
			params.Speed = params.Speed or 1
			params.ZSpacing = params.ZSpacing or 1
			params.IRot = params.IRot or 0
			params.SState = params.SState or 0
			params.Remainder = params.Remainder or 0
			params.SpinAng = params.SpinAng or 0

		else

			local x = params.X_num or 0
			x = type(x) == "number" and { -math.abs(x), math.abs(x) } or x
			params.X_num = x

			local y = params.Y_num or 0
			y = type(y) == "number" and { -math.abs(y), math.abs(y) } or y
			params.Y_num = y

			params.X_coord = params.X_coord or 0 
			params.Y_coord = params.Y_coord or 0 
			params.ActorClass = params.ActorClass or "Sprite"
			params.ScrollSpeed = params.ScrollSpeed or 1
			params.Speed = params.Speed or 1

		end

	end
	
end
a["BGA_NoParams"] = BGA_NoParams


-- Framing 

local function Keep( self, val, Frames )

	while val < 0 do
		val = val + Frames[1] * Frames[2]
	end

	while val >= self:GetNumStates() do
		val = val - Frames[1] * Frames[2]
	end

	return val

end 


local function BGA_FramingXY( self, params, i, k, Frames )

	local lim = { 

		Frames[1] * k,
		Frames[1] * ( k + 1 ) - 1

	}

	lim[1] = Keep( self, lim[1], Frames ) + i * Frames[1]
	lim[2] = Keep( self, lim[2], Frames ) + i * Frames[1]
	lim[1] = Keep( self, lim[1], Frames )
	lim[2] = Keep( self, lim[2], Frames )

	local tbl = {}
	for a=lim[1],lim[2] do
		tbl[#tbl+1] = { Frame = a }
	end

	self:SetStateProperties(tbl)
	BGA_Details( self, params )

end
a["BGA_FramingXY"] = BGA_FramingXY


local function BGA_FramingY( self, params, i, k, Frames )

	local val = i

	if i * self:GetWidth() >= 640 then
		self:rotationy(180)
		val = - val - 1 - Frames[1] * 2
	elseif i * self:GetWidth() < 0 then
		self:rotationy(180)
		val = val + 1 + Frames[1] * 2
	end

	local lim = {}
	for p=1,Frames[2] do
		lim[p] = i + k * Frames[1] + p * Frames[1]
		lim[p] = Keep( self, lim[p], Frames )
	end

	local tbl = {}
	for a=1,#lim do
		tbl[#tbl+1] = { Frame = lim[a] }
	end

	self:SetStateProperties(tbl)
	BGA_Details( self, params )

end
a["BGA_FramingY"] = BGA_FramingY


local function BGA_FrameSelector( self, params )

	local tbl_Frames = {}

	if params.Frames then
		DeepCopy( params.Frames, tbl_Frames )
	else
		local p_i = params.Frame_i
		local p_l = params.Frame_l
		if p_i >= 0 then
			if p_l > p_i then
				for i=p_i,p_l do
					tbl_Frames[#tbl_Frames+1] = { Frame = i }
				end
			elseif p_l < p_i then
				for i=p_i,p_l,-1 do
					tbl_Frames[#tbl_Frames+1] = { Frame = i }
				end
			else
				tbl_Frames[#tbl_Frames+1] = { Frame = p_i }
			end
			if params.FrameReverse then
				for i=p_l,p_i,-1 do
					tbl_Frames[#tbl_Frames+1] = { Frame = i }
				end
			end
		end
	end
	
	if self:GetNumStates() > 1 then
		self:SetStateProperties(tbl_Frames)
	end

	BGA_Details( self, params )

end
a["BGA_FrameSelector"] = BGA_FrameSelector


local function BGA_PlayAllCommands(self, params)

	local function RunStuff(v)
		self:queuecommand(v)
	end

	if type(params.Commands) == "table" then
		for i=1,#params.Commands do
			RunStuff(params.Commands[i])
		end
	elseif type(params.Commands) == "string" then
		RunStuff(params.Commands)
	end

end
a["BGA_PlayAllCommands"] = BGA_PlayAllCommands

local function BGA_ChildrenStop(self, visible)
	if visible then
		self:diffusealpha(1)
	else
		self:diffusealpha(0)
	end
end
a["BGA_ChildrenStop"] = BGA_ChildrenStop
