
local tweaks = {

	{
		Index = 2,
		Remove = true
	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
		Frame_i = 9,
		Frame_l = 10,
		Commands = "TwoSprites",
		Script = "/BGAnimations/Resources/Scripts/LineXY.lua"
	}

}

return Def.ActorFrame{ 
	loadfile( "/BGAnimations/5th001G/default.lua" )( tweaks ),
	loadfile( tweaks[2]["Script"] )( tweaks[2] )
}