
local tweaks = {

	{
		Index = 1,
		Commands = { "Mirror", "Fade" },
		Color = Color.Black
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x3.png",
		X_num = { -6, 5 },
		Y_num = { -3, 2 },
		Frame_i = 6,
		ResetParams = true,
		Commands = { "SpinFrame" },
		Zoom = 0.75,
		Script = "/BGAnimations/Resources/Scripts/1st/SpinFrame.lua"
	}

}

return Def.ActorFrame{ 
	LoadActor( "../1stBG001", tweaks )..{}
}