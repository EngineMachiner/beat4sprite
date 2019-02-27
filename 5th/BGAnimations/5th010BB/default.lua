local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A.lua")..{
		OnCommand=function(self)

			local child_w = self:GetChild(""):GetChild("template"):GetWidth()

			self:x(0)
			:linear(2.25*SCREEN_WIDTH/child_w) --uses Tool.lua
			:x(-child_w*6*ScaleVar)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
			end
	};
	LoadActor("A.lua")..{
		OnCommand=function(self)

			local child_w = self:GetChild(""):GetChild("template"):GetWidth()

			self:x(child_w*6*ScaleVar)
			:linear(2.25*SCREEN_WIDTH/child_w) --uses Tool.lua
			:x(0)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
			end	
	};

--[[ Testing sync with texcoord...
	LoadActor("/BGAnimations/Backgrounds/5th/5 (stretch).png")..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4
				
		self:Center()
			:zoom(3*ScaleVar)
			:texcoordvelocity(2*texcoordvelocity_x*(640/self:GetWidth()),0) --esto estaba mal tenia el sentido opuesto, revisar todo
			:customtexturerect(0,0,3,3)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end
	},]]

}