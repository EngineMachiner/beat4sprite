local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/26 (stretch).png")..{
		OnCommand=function(self)

				local relative_posy = (self:GetHeight()/2)/self:GetHeight()
				local texcoordvelocity_y = relative_posy/4
				
		self:Center()
			:zoom(6*ScaleVar)
			:texcoordvelocity(0,texcoordvelocity_y*(2*480/self:GetHeight()))
			:customtexturerect(0,0,6,6)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4)
			:effectclock('beat')
		end
	},

	LoadActor("../Scripts/WallBumpEffect1stCycle/default.lua", "/BGAnimations/Sprites/5th/2 4x1 Bomb.png", ScaleVar)..{},
}