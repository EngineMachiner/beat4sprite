local file = "/BGAnimations/Backgrounds/5th/30 (stretch).png"
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(file)..{
		OnCommand=function(self)
		BGA_TCV_OrL(self, 0, 1) 
		self:Center()
			:zoom(7*ScaleVar)
			:customtexturerect(0,0,7,7)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4)
			:diffuseramp():effectcolor1(1,1,1,1):effectcolor2(0,0,0,0)
			:effectclock('beat')
		end
	},

	LoadActor("../Scripts/ParticlesDown", "/BGAnimations/Sprites/5th/Volt 2x1.png")..{}

}