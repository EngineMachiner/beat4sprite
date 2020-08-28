
local replace = ...

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self.Name = "a"
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end

}

local tweaks = {


	{ 
		Index = 1,
		File = "/BGAnimations/Resources/5th/Sprites/D 5x4.png",
		X_num = 5,
		Y_num = { -2, 1 },
		Frame_i = 1,
		Frame_l = 20,
		Commands = "FramePerSprite",
		ResetParams = true
	},

	{
		Index = 2,
		Remove = true
	}

}

	tweaks.AddActors = {} 
	tweaks.AddActors[#tweaks.AddActors+1] = BGA_IQB()

	BGA_ParamsTweaks( tweaks, replace )

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

	tweaks.AddActors = nil
	tweaks[1]["File"] = "/BGAnimations/Resources/5th/Sprites/HSV/D 5x4.png"
	tweaks[1]["Commands"] = { "FramePerSprite", "Pulse" }

	t[#t+1] = LoadActor( "/BGAnimations/5th001A", tweaks )..{}

local params_2 = {}

	DeepCopy(tweaks[1], params_2)
	params_2["Fade"] = { 1, 1 }
	params_2["ActorClass"] = "Quad"
	params_2["Color"] = "Rainbow"
	params_2["Commands"] = { "Pulse", "Fade", "Blend" }

	t[#t+1] = LoadActor( "/BGAnimations/Resources/Scripts/TileTool.lua", params_2 )..{}

return Def.ActorFrame{ t }