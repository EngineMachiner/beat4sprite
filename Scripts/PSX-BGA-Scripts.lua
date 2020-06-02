
--Used but not directly

function StringTable( tbl )

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

		   		if type(v) ~= "table" then

		   			if last_i > 1 then
		   				if index == last_i then
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. k .. " = " .. tostring(v) .. "\n"
		   				else
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. k .. " = " .. tostring(v) .. ",\n"
		   				end
		   			else
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. k .. " = " .. tostring(v) .. "\n"
		   			end

		   		else
		   			
		   			if index == last_i then
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. k .. " = " .. Reload( v )	
		   			else
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. k .. " = " .. Reload( v ) 
		   				tbl_s["space"] = string.sub(tbl_s["space"], 1, #tbl_s["space"]-4)
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. "},\n"
		   			end
		   		end

		   	else

		   		if type(v) ~= "table" then

		   			if last_i > 1 then
		   				if index == last_i then
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. tostring(v) .. "\n"
		   				else
		   					tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. tostring(v) .. ",\n"
		   				end
		   			else
		   				tbl_s["s"] = tbl_s["s"] .. tbl_s["space"] .. tostring(v) .. "\n"
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

function BGA_ToolPreview(self)
	if SCREENMAN:GetTopScreen():GetName() == "ScreenMiniMenuBackgroundChange" then
		self:effectclock("timer")
		self:set_tween_uses_effect_delta(false)
		self:hurrytweening(0.25)
	end
end

-- Direct Calls

function BGA_TileTool( frame, params )
	frame[#frame+1] = LoadActor("/BGAnimations/Resources/Scripts/TileTool.lua", params)..{}
end

function BGA_Scale( self )

	local ScaleVar = SCREEN_HEIGHT / 480 -- Theme scale
	ScaleVar = ScaleVar * ( 480 / self:GetTexture():GetImageHeight() ) -- Image scale
	self:zoom(ScaleVar)

end

function BGA_IQB()
	return Def.Quad{
		GainFocusCommand=function(self)
			self:blend("BlendMode_InvertDest")
			self:SetSize(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:Center()
		end
	}
end

function BGA_ScrollTextures( frame, params )

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

	local ignore = {

		"Index",
		"ID",
		"ResetParams",
		"AddActors"

	}

function BGA_ParamsTweaks( params, tweaks ) -- These tweaks are BEFORE creating the Actor!

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

function BGA_PostSpawn( frame, params, tweaks ) -- These tweaks are AFTER creating the Actor!

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

function BGA_NoParams( params )

	local function Replace(val, add)
		if val then
			val = val + add
		else
			val = 0
		end
		return val
	end

	if params then
		params.Frame_i = Replace(params.Frame_i, -1)
		if not params.Frame_l then 
			params.Frame_l = params.Frame_i
		else
			params.Frame_l = Replace(params.Frame_l, -1)
		end 
	end
	
end

function BGA_FramingXY( self, params, i, k, Frames )

	local lim = { 

		Frames[1] * k,
		Frames[1] * ( k + 1 ) - 1

	}

	local function Keep( val )

		while val < 0 do
			val = val + Frames[1] * Frames[2]
		end

		while val > self:GetNumStates() - 1 do
			val = val - Frames[1] * Frames[2]
		end

		return val

	end

	lim[1] = Keep( lim[1] ) + i * Frames[1]
	lim[2] = Keep( lim[2] ) + i * Frames[1]
	lim[1] = Keep( lim[1] )
	lim[2] = Keep( lim[2] )

	local tbl = {}
	for a=lim[1],lim[2] do
		tbl[#tbl+1] = { Frame = a }
	end

	self:SetStateProperties(tbl)
	BGA_Details( self, params )

end

function BGA_FrameSelector( self, params )

	local tbl_Frames = {}

	if params.Frames then
		DeepCopy( params.Frames, tbl_Frames )
	else
		if params.Frame_i >= 0 then
			if params.Frame_l > params.Frame_i then
				for i=params.Frame_i,params.Frame_l do
					tbl_Frames[#tbl_Frames+1] = { Frame = i }
				end
			elseif params.Frame_l < params.Frame_i then
				for i=params.Frame_i,params.Frame_l,-1 do
					tbl_Frames[#tbl_Frames+1] = { Frame = i }
				end
			else
				tbl_Frames[#tbl_Frames+1] = { Frame = params.Frame_i }
			end		
		end
	end

	if self:GetNumStates() > 1 then
		self:SetStateProperties(tbl_Frames)
	end

	BGA_Details( self, params )

end

function BGA_Details( self, params )

	BGA_Scale(self)
	BGA_ToolPreview(self)
	self:SetTextureFiltering(false)

	if not params.Frames then
		if params.Delay then
			self:SetAllStateDelays(params.Delay)
		else
			self:SetAllStateDelays(1/self:GetNumStates())
		end
	end

	if params.Random then
		self:setstate(math.random(0,self:GetNumStates()-1))
	end

end

function BGA_PlayAllCommands(self, params)
	if type(params.Commands) == "table" then
		for i = 1,#params.Commands do
			 self:playcommand(params.Commands[i])
		end
	elseif type(params.Commands) == "string" then
		self:playcommand(params.Commands)
	end
end

function BGA_StopAll( t )

	t["GainFocusCommand"]=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(true)
		end )
	end

	t["LoseFocusCommand"]=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
		end )
	end

end