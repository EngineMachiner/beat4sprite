local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/23 (stretch).png", 
		OnCommand=function(self)
			self:Center():zoom(5*ScaleVar):customtexturerect(0,0,5,5)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:queuecommand("Animation")
			BGA_TCV_OrL(self, 0, 0.5)
		end,
		AnimationCommand=function(self)
			self:diffusealpha(0):sleep(1*0.5):diffusealpha(1):sleep(1*0.5)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:queuecommand("Animation")
		end
	},

	Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/24 (stretch).png", 
		OnCommand=function(self)
			self:Center():zoom(5*ScaleVar):customtexturerect(0,0,5,5)
				:set_use_effect_clock_for_texcoords(true)
				:effectclock("beat")
				:queuecommand("Animation")
			BGA_TCV_OrL(self, 0, 0.5)
		end,
		AnimationCommand=function(self)
			self:diffusealpha(1):sleep(1*0.5):diffusealpha(0):sleep(1*0.5)
				:set_tween_uses_effect_delta(true):effectclock("beat")
				:queuecommand("Animation")
		end
	},

	LoadActor("../Scripts/InnerEffect/Whirl","/BGAnimations/Sprites/5th/Orange 2x1.png")..{}

}