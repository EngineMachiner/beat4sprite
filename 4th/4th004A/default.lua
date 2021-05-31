
local t = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/4th/Sprites/Gradients/A.png",
		X_num = { -6, 5 },
		Y_num = { -3, 2 },
		Zoom =  0.93,
		SpinMag = { 0, 0, 90 },
		Commands = "SpinFrame",
		Color = color("#0000FF"),
		Script = "/BGAnimations/Resources/Scripts/AFTSpin.lua"
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/ABCD 5x4.png",
		Frames = 1,

	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
		Frames = { 2, 15 },
		Even = true
	}

}

for i=2,3 do
	t[i]["Script"] = "/BGAnimations/Resources/Scripts/Explode.lua"
	t[i]["Blend"] = "BlendMode_Add"
	t[i]["Spin"] = true
end

t[4] = DeepCopy(t[2])
t[4]["File"] = "/BGAnimations/Resources/4th/Sprites/ABCDE 5x4.png"
t[4]["Frames"] = { 5, 20 }
t[4]["Spin"] = false

t[5] = t[3]

for i=4,5 do
	t[i]["Sleep"] = 4
end

return Def.ActorFrame{

	loadfile( t[1]["Script"] )( t[1] ),

	loadfile( t[2]["Script"] )( t[2] ),
	loadfile( t[3]["Script"] )( t[3] ),

	loadfile( t[4]["Script"] )( t[4] ),
	loadfile( t[5]["Script"] )( t[5] )

}