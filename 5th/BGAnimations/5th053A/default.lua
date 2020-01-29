
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) 
			child:visible(false):finishtweening() 
		end)
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/56 (stretch).png")..{
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8
			;effectclock,"beat")
	},

	LoadActor( "../Scripts/TileTool", "/BGAnimations/Sprites/5th/Flower.png", 3, 2 )..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/2)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:queuecommand("SpinY")
		end
 	},

}