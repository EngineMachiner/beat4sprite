local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/31 (stretch).png")..{
		OnCommand=cmd(Center;zoom,12*ScaleVar;customtexturerect,0,0,12,12)
	};
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*2)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*3)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*4)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*5)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*6)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*7)
		end
	},
	
		LoadActor("../ParticleEffects/InnerEffect/CircleIn","/BGAnimations/Sprites/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*8)
		end
	},
}