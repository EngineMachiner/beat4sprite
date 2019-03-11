
local tbl = {}

if GAMESTATE:GetCurrentSong():HasBackground() then 
	tbl.file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
else 
	tbl.file = "/BGAnimations/Backgrounds/fallback.png"
end

local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.Quad{
		OnCommand=function(self)
			self:diffuse(Color.Black)
			self:FullScreen()
		end
	},

	LoadActor( "../Scripts/BGExtender", tbl.file )..{
		OnCommand=function(self)
			self:diffuseramp():effectcolor1(1,1,1,1):effectcolor2(0.5,0.5,0.5,0.5):effectclock('beat')
		end
	},

	LoadActor("../Scripts/ParticlesDownSpin/2", "/BGAnimations/Sprites/5th/Jewel.png", "/BGAnimations/Sprites/5th/Ring.png")..{}
}