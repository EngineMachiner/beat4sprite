
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Sprites/5th/ClothesSprites/BG.png")..{ OnCommand=cmd(Center;zoom,ScaleVar) },
	LoadActor("/BGAnimations/Sprites/5th/ClothesSprites/BG.png")..{ OnCommand=cmd(Center;zoom,ScaleVar;rotationy,180;x,self:GetX()+self:GetWidth()) },
	LoadActor("/BGAnimations/Sprites/5th/ClothesSprites/BG.png")..{ OnCommand=cmd(Center;zoom,ScaleVar;rotationy,180;x,self:GetX()-self:GetWidth()) },
	LoadActor("A.lua")..{},
	LoadActor("A.lua")..{ OnCommand=cmd(x,1495*ScaleVar;rotationy,180) },
	LoadActor("A.lua")..{ OnCommand=cmd(x,215*ScaleVar;rotationy,180) }
	
}