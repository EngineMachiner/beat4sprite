
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		Frame_i = 4
	}

}

	t[#t+1] = LoadActor( "/BGAnimations/5th001C", tweaks )..{}

return Def.ActorFrame{ t }