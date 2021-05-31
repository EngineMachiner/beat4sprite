
local t = Def.ActorFrame{}

local tweaks = {

	{	
		Index = 1,
		File = {
			"/BGAnimations/Resources/4th/Backgrounds/F.png",
			"/BGAnimations/Resources/4th/Backgrounds/F2.png"
		},
		BGMirror = true,
		Reversed = true
	},

	{
		Index = 2,
		Remove = true
	}

}

return Def.ActorFrame{
	loadfile( "/BGAnimations/4th001A/default.lua" )( tweaks )
 }