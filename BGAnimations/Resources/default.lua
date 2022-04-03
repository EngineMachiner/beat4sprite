local BGA_dirs = FILEMAN:GetDirListing( "//BGAnimations/", true, true )
local s = BGA_dirs[ math.random( 1, #BGA_dirs ) ] .. "/default.lua"
return loadfile(s)()