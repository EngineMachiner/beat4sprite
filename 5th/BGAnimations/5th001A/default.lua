local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 4x1.png", 1/(4), ScaleVar, OffsetY )..{},

	LoadActor("/BGAnimations/Backgrounds/5th/5 (stretch).png")..{
		OnCommand=function(self)

-- The next variables define an accurate velocity (almost like the PSX emulation) according to the sizes of the sprites.

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4
				
		self:Center()
			:zoom(3*ScaleVar)
			:texcoordvelocity(-2*texcoordvelocity_x*(640/self:GetWidth()),0)
			:customtexturerect(0,0,3,3)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end
	},

}