local ScaleVar = _screen.h/480
local tool_sprite = "/BGAnimations/Sprites/5th/Symbol3.png"
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/8 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar)
	};
	LoadActor("../Backgrounds/5th/8 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("../Backgrounds/5th/8 (stretch).png")..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-self:GetWidth()*ScaleVar;zoomx,-1)
	};
	LoadActor("../Scripts/TileTool", tool_sprite, 0, ScaleVar, false )..{ 
		OnCommand=function(self)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:queuecommand("SpinX")
		end
 	},
}