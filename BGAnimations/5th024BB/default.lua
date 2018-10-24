local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("../Backgrounds/31 (stretch).png")..{
		OnCommand=cmd(Center;zoom,12*ScaleVar;customtexturerect,0,0,12,12)
	};

	Def.ActorFrame{

			OnCommand=function(self)
				self:queuecommand("Spin")
			end,

		LoadActor("../ParticleEffects/InnerEffect/CircleIn", "/BGAnimations/Sprites/3.png", true)..{
			SpinCommand=function(self)
				self:xy(SCREEN_WIDTH/2,SCREEN_HEIGHT/2):rotationz(self:GetRotationZ()):linear(42/5):rotationz(self:GetRotationZ()+720)
				:set_tween_uses_effect_delta(true):effectclock('beat'):queuecommand("Spin")
			end
		},
	},
	
}