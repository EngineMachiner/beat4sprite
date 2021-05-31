
local tweaks = {

	{
		Index = 1,
		Commands = { "Mirror", "Fade" },
		Fade = { 0, 1 },
		Color = Color.Black
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		X_num = { -6, 5 },
		Y_num = { -3, 2 },
		Frame_i = 6,
		ResetParams = true,
		Commands = { "SpinFrame" },
		Zoom = 0.93,
		Script = "/BGAnimations/Resources/Scripts/AFTSpin.lua"
	}

}

return Def.ActorFrame{ 
	loadfile( "/BGAnimations/1stBG001/default.lua" )( tweaks )
}