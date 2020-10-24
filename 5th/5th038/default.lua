-- Example to simulate two actors (with different textures) as one animated frame synced.

local t = Def.ActorFrame{}

local d = 1
local f = { 15, 16, 5, 6 }
local g = {}

for i=1,#f do
	if i == 1 then
		g[i] = { Frame = f[i] - 1, Delay = d * 3  }
	else
		g[i] = { Frame = f[i] - 1, Delay = d }
	end
end

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/AB 4x4.png",
	Frames = g,
	X_num = { -4, 3 },
	Y_num = { -2, 1 },
	ResetParams = true

}

	t[#t+1] = LoadActor("../5th037", params)..{}


	f = { 12, 11 }
	g = {}

for i=1,#f do
	g[i] = { Frame = f[i] - 1, Delay = d }
end

	params = {

	Index = 1,
	File = "/BGAnimations/Resources/5th/Sprites/A 4x3.png",
	Frames = g,
	X_num = { -4, 3 },
	Y_num = 1,
	ResetParams = true

}

	t[#t+1] = LoadActor("../5th037", params)..{
		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			self:diffusealpha(0):sleep(d)
				:diffusealpha(1):sleep(d*2)
				:diffusealpha(0):sleep(d*3)
				:queuecommand("On")
		end
	}


return Def.ActorFrame{ t }