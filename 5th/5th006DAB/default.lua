
local tweaks = {

	Index = 1,
	Commands = { "StairsStates", "Cross", "Move" },
	Delay = 0.25,
	Cross = 3 
		--[[ Removes diagonally N actors (vertically and horizontally), 
			without Cross parameter it just divides by horizontally. ]]
}

local t = LoadActor( "/BGAnimations/5th006B", tweaks )..{}

	tweaks.File = "/BGAnimations/Resources/5th/Sprites/HSV/DABCD2 1x4.png"
	tweaks.Commands = { "StairsStates", "Move" }

return Def.ActorFrame{

	LoadActor( "/BGAnimations/5th006B", tweaks )..{},
	t

}