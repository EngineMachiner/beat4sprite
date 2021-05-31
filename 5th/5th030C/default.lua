
local replace = ...

local tweaks = {

	{
		Index = 2,
		Remove = true
	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
		Frame_i = 10,
		Commands = "TwoSprites",
		Script = "/BGAnimations/Resources/Scripts/SpaceEffects/Stairs.lua"
	}

}

	BGA_G.ParTweak( tweaks, replace )

return Def.ActorFrame{ 
	loadfile( "/BGAnimations/5th001G/default.lua" )( tweaks ),
	loadfile( tweaks[2]["Script"] )( tweaks[2] )
}