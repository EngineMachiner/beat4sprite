local t = Def.ActorFrame{}

local s = "/BGAnimations/Resources"
local d = ...

if not d then 
	d = 1
end

local f = { 1, 3 }
local g = {}

for i=1,#f do
	if i == 1 then
		g[i] = { Frame = f[i] - 1, Delay = d }
	else
		g[i] = { Frame = f[i] - 1, Delay = d }
	end
end

local params = {

	Index = 1,
	File = s .. "/5th/Backgrounds/BABC 2x2.png",
	CustomFrames = g,
	X_num = { -2, 1 },
	Y_num = { -1, 0 },
	Cleanup = true

}

	t[#t+1] = loadfile( "/BGAnimations/5th037/default.lua" )( params )


	f = { 9, 10 }
	g = {}

for i=1,#f do
	g[i] = { Frame = f[i] - 1, Delay = d }
end

	params = {

	Index = 1,
	File = s .. "/5th/Sprites/BAB 4x4.png",
	CustomFrames = g,
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	Cleanup = true

}

	t[#t+1] = loadfile( "/BGAnimations/5th037/default.lua" )( params )


return Def.ActorFrame{ t }