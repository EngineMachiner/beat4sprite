
local t = Def.ActorFrame{}

local params = {
	Index = 1,
	File = "/BGAnimations/Resources/5th/Backgrounds/C.png"
} 

	t[#t+1] = LoadActor("../5th044A", params)..{}

return Def.ActorFrame{ t }
