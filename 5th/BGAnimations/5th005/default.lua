local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	Def.ActorFrame{

			Def.Sprite{
			Texture = "/BGAnimations/Backgrounds/5th/11 (stretch).png", 
			OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,2/2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		};
			Def.Sprite{
			Texture = "/BGAnimations/Backgrounds/5th/10 (stretch).png", 
			OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,1/2;diffusealpha,0;sleep,1/2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		};

	},
	
	Def.ActorFrame{

			LoadActor("../Scripts/WallBumpEffect1stCycle/default.lua","/BGAnimations/Sprites/5th/Globe 6x1.png",ScaleVar)..{},

	},

}