
local t = Def.ActorFrame{}

local tweaks = {
	Index = 2,
	Color = { Color.Black, color("0,0.5,0,1") },
	Fade = { 0, 1 },
	FadePeriodBy = 0.25,
	Commands = { "Mirror", "Fade" }
}

return Def.ActorFrame{ loadfile("/BGAnimations/1stBG005/default.lua")(tweaks) }