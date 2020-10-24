
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
		ResetParams = true,
		Y_num = { -2, 1 },
		X_num = { -4, 3 },
		Frame_l = 12,
		Delay = 1/12,
		Y_coord = -1,
		Commands = "Move"
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2, params_3 = {}, {}

	DeepCopy( params[1], params_2 )
	params_2["ActorClass"] = "Quad"
	params_2["Commands"] = { "Move", "Fade", "Blend" }
	params_2["Fade"] = { 4, 1 }
	params_2["Color"] = Color.Red

	DeepCopy( params_2, params_3 )
	params_3["Color"] = Color.Black

return Def.ActorFrame{

	Def.Quad{
		OnCommand=function(self)
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
	LoadActor( "../Resources/Scripts/TileTool.lua", params_2 )..{},
	LoadActor( "../Resources/Scripts/TileTool.lua", params_3 )..{}

}