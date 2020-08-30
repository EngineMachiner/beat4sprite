
local replace = ...

local t = Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end
}

local params = {

	{
		X_num = 2,
		Index = 1,
		X_coord = 0
	}	

}

params.AddActors = {} 
params.AddActors[#params.AddActors+1] = BGA_IQB()

	BGA_ParamsTweaks(params,replace)

	t[#t+1] = LoadActor( "/BGAnimations/5th034A", params )..{}

local params = {
	File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12,
	X_num = 4,
	Y_num = 1,
	X_coord = -1,
	ScrollSpeed = 2,
	Commands = { "Move" }
}

	t[#t+1] = LoadActor( "../Resources/Scripts/TileTool.lua", params )..{}

return Def.ActorFrame{ t }