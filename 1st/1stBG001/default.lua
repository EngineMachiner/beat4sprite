
local t = Def.ActorFrame{}

local tweaks = ...

local params = {

	{
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		Commands = "Mirror",
		BGMirror = true,
		X_num = 1
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/1st/Sprites/H 5x4.png",
		Frame_i = 1,
		Frame_l = 2,
		Spin = true,
		Zoom = 0.8,
		Script = "/BGAnimations/Resources/Scripts/1st/Z_Effects/Stairs.lua"
	}

}

	PSX_BGA_Globals["BGA_ParamsTweaks"]( params, tweaks )
	PSX_BGA_Globals["BGA_TileTool"]( t, params[1] )
	t[#t+1] = LoadActor(params[2]["Script"], params[2])..{}


return Def.ActorFrame{ t }