local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("A.lua")..{
		OnCommand=cmd(y,0;linear,self:GetChild(""):GetHeight()/55;y,-480*ScaleVar;set_tween_uses_effect_delta,true;queuecommand,"On")
	};

	LoadActor("../ParticleEffects/InnerEffect/Whirl","Orange 2x1.png")..{
		OnCommand=function(self)
			self:effectclock('beat')
		end
	};
	LoadActor("../ParticleEffects/InnerEffect/Whirl","Orange 2x1.png")..{
		OnCommand=function(self)
			self:effectclock('beat')
			:hibernate(6)
		end
	};
	LoadActor("../ParticleEffects/InnerEffect/Whirl","Orange 2x1.png")..{
		OnCommand=function(self)
			self:effectclock('beat')
			:hibernate(6*2)
		end
	};
	LoadActor("../ParticleEffects/InnerEffect/Whirl","Orange 2x1.png")..{
		OnCommand=function(self)
			self:effectclock('beat')
			:hibernate(6*3)
		end
	};
}