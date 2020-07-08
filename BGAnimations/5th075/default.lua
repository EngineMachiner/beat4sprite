
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Backgrounds/AB.png",
		ResetParams = true,
		X_num = 1,
		Commands = "Mirror",
		BGMirror = true
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {

	Index = 3,
	File = "/BGAnimations/Resources/5th/Sprites/X3 5x4.png",
	ResetParams = true,
	Y_num = { -2, 1 },
	X_num = 2,
	Frame_l = 20,
	FramingY = true,
	Commands = { "Pulse" }

}

return Def.ActorFrame{

	Def.Quad{
		GainFocusCommand=function(self)
			self:visible(true)
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:Center()
			self:diffuse(Color.Black)
		end,
		LoseFocusCommand=function(self)
			self:visible(false)
		end
	},

	LoadActor( "../5th001A", params )..{},
	LoadActor( "../Resources/5th/Scripts/TileTool.lua", params_2 )..{}

}