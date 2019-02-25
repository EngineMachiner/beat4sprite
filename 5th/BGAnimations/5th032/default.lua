local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/40 (stretch).png")..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4
				
		self:Center()
			:zoom(ScaleVar):SetSize(640,480)
			:texcoordvelocity(2*texcoordvelocity_x*(640/self:GetWidth()),0)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end
	};
	LoadActor("../Backgrounds/40 (stretch).png")..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4

			self:Center()
			:zoom(ScaleVar):SetSize(640,480):x(self:GetX()+self:GetWidth()*ScaleVar)
			:texcoordvelocity(2*texcoordvelocity_x*(640/self:GetWidth()),0)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end
	};
	LoadActor("../Backgrounds/40 (stretch).png")..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4

			self:Center()
			:zoom(ScaleVar):SetSize(640,480):x(self:GetX()-self:GetWidth()*ScaleVar)
			:texcoordvelocity(2*texcoordvelocity_x*(640/self:GetWidth()),0)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end
	};
	LoadActor("B.lua")..{
			OnCommand=cmd(addy,12)
	};
}