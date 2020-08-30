
local params = {
	File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12,
	Commands = { "Move", "Cross" },
	NumTextures = 1,
	NumItemsX = 0,
	X_pos = 1,
	X_num = 5,
	Y_num = 1,
	X_coord = 1,
	ScrollSpeed = 0.5,
}

local t = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

	params["File"] = "/BGAnimations/Resources/5th/Sprites/HSV/DABCDE 4x3.png"
	params["Frame_i"] = 1
	params["Commands"] = { "Move", "Cross" }
	params["X_num"] = 5
	params["X_pos"] = 0

local t2 = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

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

	t,

	t2

}