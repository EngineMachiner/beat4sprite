
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor( "../Scripts/BGExtender", "/BGAnimations/Backgrounds/5th/39 (stretch).png" )..{},

	LoadActor("/BGAnimations/Backgrounds/5th/5 (stretch).png")..{

		OnCommand=function(self)
		
			BGA_TCV_OrL(self, -1, 0)
				
			self:Center()
				:zoom(1*ScaleVar)
				:customtexturerect(0,0,1,1)
				:set_use_effect_clock_for_texcoords(true)
				:addimagecoords(self:GetWidth()/4,0)
				:effectclock('beat')

		end

	}
	
}