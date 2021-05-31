
local args = ...
local t = Def.ActorFrame{}

local params = {

	{	
		Index = 1,
		File = "/BGAnimations/Resources/4th/Sprites/BAB 5x4.png",
		Frames = 13,
		X_num = { -6, 4 },
		Y_num = 2,
		TCV = { 0, -1 },
		HurryTweenBy = 2,
		Script = "/BGAnimations/Resources/Scripts/TileTool.lua"
	},

	{
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/BAB 5x4.png",
		Frames = 12,
		Dir = "Down",
		Spin = true,
		Color = color("1,0.25,0.25,1"),
		Blend = 'add',
		Alpha = 0.75,
		Script = "/BGAnimations/Resources/Scripts/Particles.lua"
	}

}

	BGA_G.ParTweak( params, args )

return Def.ActorFrame{
	loadfile( params[1].Script )( params[1] ),
	loadfile( params[2].Script )( params[2] )
}