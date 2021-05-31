
local t = Def.ActorFrame{}
local s = "/BGAnimations/Resources"

local tweaks = {

	{
		Index = 1,
		Y_num = { -2, 1 },
		Commands = "StairsStates"
	},

	{
		Index = 2,
		Remove = true
	}
	
}

	t[#t+1] = loadfile( "/BGAnimations/5th006A/default.lua" )( tweaks )

local params = {

	File = s .. "/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12

}

	t[#t+1] = loadfile( s .. "/Scripts/LineXY.lua" )( params )

	
return Def.ActorFrame{ t }