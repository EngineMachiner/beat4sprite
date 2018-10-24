local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Sprites/ClothesSprites/BG.png")..{ OnCommand=cmd(Center;zoom,ScaleVar) };
	LoadActor("../Sprites/ClothesSprites/BG.png")..{ OnCommand=cmd(Center;zoom,ScaleVar;xy,self:GetX()+self:GetWidth()*ScaleVar,self:GetY()) };
	LoadActor("../Sprites/ClothesSprites/BG.png")..{ OnCommand=cmd(Center;zoom,ScaleVar;xy,self:GetX()-self:GetWidth()*ScaleVar,self:GetY()) };
	LoadActor("A.lua")..{ OnCommand=cmd(rainbow;effectperiod,8;effectclock,"beat") };
	LoadActor("A.lua")..{ OnCommand=cmd(rainbow;effectperiod,8;effectclock,"beat";x,640*ScaleVar) };
	LoadActor("A.lua")..{ OnCommand=cmd(rainbow;effectperiod,8;effectclock,"beat";x,-640*ScaleVar) };
}