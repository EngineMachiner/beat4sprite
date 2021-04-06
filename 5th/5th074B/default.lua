
local params = {

	{
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
		Cleanup = true,
		Y_num = { -2, 1 },
		X_num = { -4, 3 },
		Frame_l = 12,
		Y_coord = -1,
		FrmDelay = 0.5,
		HurryTweenBy = 4,
		Commands = "Move",
	},

	{
		Index = 2,
		Remove = true
	}

}

local params_2 = {}
local params_3 = {}

DeepCopy( params[1], params_2 )
params_2["Class"] = "Quad"
params_2["Commands"] = { "Fade", "Blend", "Move" }
params_2["Fade"] = { 4, 1 }
params_2["EffectOffset"] = - 1.5
params_2["FadePeriodBy"] = 0.5
params_2["HurryTweenBy"] = 2
params_2["Color"] = Color.Red

DeepCopy( params_2, params_3 )
params_3["Color"] = Color.Black
	
params_2["X_pos"] = 0
params_3["X_pos"] = -1

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