local BGA_dirs = FILEMAN:GetDirListing( "//BGAnimations/", true, true )

function PTable( tbl, used, i )

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

return Def.ActorFrame{	
	LoadActor( BGA_dirs[ math.random( 1, #BGA_dirs ) ] )..{}
}