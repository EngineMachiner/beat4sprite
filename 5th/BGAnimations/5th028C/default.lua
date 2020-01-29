local ScaleVar = _screen.h/480

local sprites = {

	"/BGAnimations/Sprites/5th/Jewel.png", 
	"/BGAnimations/Sprites/5th/Ring.png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/38 (stretch).png")..{
		OnCommand=function(self)		
			self:Center()
				:zoom(7*ScaleVar)
				:customtexturerect(0,0,7,7)
				:set_use_effect_clock_for_texcoords(true)
				:rainbow():effectperiod(8)
				:addimagecoords(0,self:GetHeight()/4)
				:effectclock('beat')
			BGA_TCV_OrL(self, 0, 1)
		end
	},

	LoadActor("../Scripts/InnerEffect/Whirl", sprites)..{}

}