function StringTable( tbl, used, i )

	if used == nil then used = {} end

	local tbl_s = {}

	if not tbl_s["s"] then
		tbl_s["s"] = ""
	end

	if not i then
		tbl_s["i"] = 0
	else
		tbl_s["i"] = i
	end

	for k,v in pairs( tbl ) do

		if used[ v ] ~= true then
			tbl_s["s"] = tbl_s["s"] .. tostring( v ) .. " \n"
		end

		if type( v ) == "table" and used[ v ] ~= true then
			used[ tbl ] = true
			tbl_s["s"] = tbl_s["s"] .. PTable( tbl, used ) .. " \n"
		end

	end

	return tbl_s["s"]
	
end

function BGA_TCV_OrL(self, x, y, linear, s)

	local tbl = {}

		tbl["x_dir"] = x
		tbl["y_dir"] = y
		tbl["s"] = "On"

	if not s then s = tbl["s"] end

	if x then
		if not linear then
			if self:GetWidth() < 640 then
				for i = 1,6 do
					if self:GetWidth() * i >= 640 then
						tbl["x"] = 0.132*i*2*tbl["x_dir"] * 0.5
					break
					end
				end
			else
				tbl["x"] = 0.132*tbl["x_dir"]*(1+0.1*self:GetWidth()/640)
			end
		else
			tbl["x"] = 0.132*tbl["x_dir"]*(1+0.1*640/640) 
		end
	else
		tbl["x"] = 0
	end

	if y then
		if not linear then
			if self:GetHeight() < 480 then
				for i = 1,6 do
					if self:GetHeight() * i >= 480 then
						tbl["y"] = 0.124*i*2*tbl["y_dir"] * 0.5
					break
					end
				end
			else
				tbl["y"] = 0.124*tbl["y_dir"]*(1+0.1*self:GetHeight()/480)
			end
		else
			tbl["y"] = 0.124*tbl["y_dir"]*(1+0.1*480/480)
		end
	else
		tbl["y"] = 0
	end

	if not linear then 
		self:texcoordvelocity( tbl["x"], tbl["y"] )
	else
		self:xy( self:GetX(), self:GetY() ):linear( math.sqrt( (tbl["x"])^2 + (tbl["y"])^2 ) * 5.5 * 2 )
			:xy( math.round( 1100 * tbl["x"] + self:GetX() ), math.round( 875 * tbl["y"] + self:GetY() ) )
		self:effectclock("beat")
		self:set_tween_uses_effect_delta(true)
		ToolPreview(self)
		self:queuecommand("On")
	end

end

function ToolPreview(self)
	if SCREENMAN:GetTopScreen():GetName() == "ScreenMiniMenuBackgroundChange" then
		self:effectclock("timer")
		self:set_tween_uses_effect_delta(false)
		self:hurrytweening(0.25)
	end
end

function AnimationDelay(self)
	self:SetAllStateDelays(self:GetNumStates()^-1)
end

function SpriteLimit( w, h )

	local tbl = {}

	if not w then tbl["x"] = 0 end
	if not h then tbl["y"] = 0 end

	for i=1,8 do
		if w and w * i >= 640 then
			tbl["x"] = i
		break
		end
	end

	for i=1,8 do
		if h and h * i >= 480 then
			tbl["y"] = i
		break
		end
	end

	return { tbl["x"], tbl["y"] }

end