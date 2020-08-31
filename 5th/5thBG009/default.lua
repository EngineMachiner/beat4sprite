
local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABC 4x4.png",
	Frame_i = 11,
	Frame_l = 12,
	Dir = "Down",
	Commands = { "TwoSprites" },
	Spin = true

}

return Def.ActorFrame{

	Def.Quad{
		GainFocusCommand=function(self)
			self:diffuse(Color.Black)
			self:FullScreen()
			self:visible(true)
		end,
		LoseFocusCommand=function(self)
			self:visible(false)
		end
	},

	LoadActor( "../Resources/Scripts/TileTool.lua", {
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		X_num = 1,
		BGMirror = true,
		Commands = { "Fade", "Mirror" },
		Ramp = true,
		Color = color("#808080")
	}  )..{},

	LoadActor( "../Resources/Scripts/5th/Particles.lua", params )..{}

}