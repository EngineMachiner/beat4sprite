local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/37 (stretch).png")..{
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8)
	};
	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/plates 4x1.png", 3, 2, false )..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/1.75)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
		end
	},
}