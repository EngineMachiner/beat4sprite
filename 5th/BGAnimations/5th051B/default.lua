local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/5th/mushroom.png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/55 (stretch).png")..{
		OnCommand=cmd(Center;x,self:GetX()+75;zoom,11*ScaleVar;customtexturerect,0,0,11,11)
	};
	LoadActor("../Scripts/TileTool", tool_sprite, 0, ScaleVar, false )..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/1.75)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:queuecommand("SpinY")
		end
 	},

}