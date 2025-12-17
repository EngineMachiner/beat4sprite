
local random = Astro.Table.random

local directory = FILEMAN:GetDirListing("/RandomMovies/", false, true )

return beat4sprite.movie { File = random(directory) }