local file = "/BGAnimations/Backgrounds/5th/3 (stretch).png"
local file2 = "/BGAnimations/Backgrounds/5th/5 (stretch).png"

local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;x,self:GetX()+self:GetWidth()*ScaleVar;zoom,ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;x,self:GetX()-self:GetWidth()*ScaleVar;zoom,ScaleVar)
	};
	LoadActor(file2)..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4
				
			self:Center()
			:zoom(3*ScaleVar)
			:texcoordvelocity(2*texcoordvelocity_x*(640/self:GetWidth()),0)
			:customtexturerect(0,0,3,3)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end
	};
}