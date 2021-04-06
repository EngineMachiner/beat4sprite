
local tweaks = {

	{
		Index = 1,
		Commands = "Mirror",
		Color = Color.Black
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/G 4x4.png",
		X_num = { -6, 5 },
		Y_num = { -3, 2 },
		Frame_i = 9,
		ResetParams = true,
		Blend = "BlendMode_Add",
		Commands = { "SpinFrame", "Alpha", "Blend" },
		Zoom = 0.93,
		Script = "/BGAnimations/Resources/Scripts/AFTSpin.lua"
	}

}

return Def.ActorFrame{ 
	LoadActor( "../1stBG001", tweaks )..{}
}