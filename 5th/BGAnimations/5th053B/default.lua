local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/5th/Flower.png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/56 (stretch).png")..{
		OnCommand=cmd(Center;zoom,10*ScaleVar;customtexturerect,0,0,10,10;effectclock,"beat")
	};
	LoadActor("../Scripts/TileTool", tool_sprite, 0, ScaleVar, false )..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/2)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:queuecommand("SpinX")
		end
 	},
}