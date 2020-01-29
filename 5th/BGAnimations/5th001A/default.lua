local ScaleVar = _screen.h/480

return Def.ActorFrame{
	
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end)
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 4x1.png", 3, 1 )..{},

	LoadActor("/BGAnimations/Backgrounds/5th/5 (stretch).png")..{
		
		OnCommand=function(self)

		BGA_TCV_OrL(self, -1, 0)

		self:Center()
			:zoom(1*ScaleVar)
			:customtexturerect(0,0,1,1)
			:set_use_effect_clock_for_texcoords(true)
			:effectclock('beat')
		end

	}
}