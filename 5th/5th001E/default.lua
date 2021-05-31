
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		Frame_i = 4
	}

}

	t[#t+1] = loadfile( "/BGAnimations/5th001C/default.lua" )( tweaks )

return Def.ActorFrame{ t }