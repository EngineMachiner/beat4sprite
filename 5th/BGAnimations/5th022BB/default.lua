local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Backgrounds/5th/DanceBackgrounds/3 1x4 .png", 1, 3 )..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/1.75)
		end
	},
	
}