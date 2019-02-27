local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/31 (stretch).png")..{
		OnCommand=cmd(Center;zoom,12*ScaleVar;customtexturerect,0,0,12,12)
	};
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*2)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*3)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*4)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*5)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*6)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*7)
		end
	},
	
		LoadActor("../Scripts/InnerEffect/CircleIn","/BGAnimations/Sprites/5th/Star.png")..{
		OnCommand=function(self)
			self:hibernate(0.7*8)
		end
	},
}