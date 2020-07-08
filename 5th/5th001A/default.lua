--Never ResetParams twice in the same table using BGA_ParamsTweaks.
local count = 0
local tweaks = ...

local t = Def.ActorFrame{}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/BA 4x3.png",
	X_num = { -4, 3 }, -- How many duplicates to the sides in an horizontal line. 	Example: X_num = 1 will create 3 Sprites
	Y_num = 1, -- How many duplicates to the sides in an vertical line.		Example: Y_num = 2 will create 3 + 2 Sprites
	Frame_i = 5, -- initial frame
	Frame_l = 8, -- last frame
	Delay = 0.5, -- sprite delay
	Commands = "RandomStates"

} 
 
 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	BGA_ParamsTweaks( params, tweaks )
	BGA_TileTool( t, params )
	BGA_PostSpawn( t, params, tweaks )
	
	params_2 = {

	File = {
		"/BGAnimations/Resources/5th/Backgrounds/BAB.png", --starts with the last BG
		"/BGAnimations/Resources/5th/Backgrounds/BAB2.png" -- first BG
	},
	X_coord = -1, -- Texture X velocity (only -1 to  1 values)
	Y_coord = 0, -- Texture Y velocity
	Speed = 1, -- tween duration
	Commands = "Move",
	ResetParams = true

}
	
 	count = count + 1
 	params_2.Index = count
 	params_2.ID = #t + 1
	BGA_ParamsTweaks( params_2, tweaks ) 
	BGA_ScrollTextures( t, params_2 )
	BGA_PostSpawn( t, params_2, tweaks )

	if params_2.AddActors then
		for k,v in pairs(params_2.AddActors) do
			t[#t+1] = v
		end
	end

return Def.ActorFrame{ t }