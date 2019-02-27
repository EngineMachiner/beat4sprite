local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	Def.ActorFrame{

			Def.Sprite{
			Texture = "../Backgrounds/5th/14 (stretch).png", 
			OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,2/2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		};
			Def.Sprite{
			Texture = "../Backgrounds/5th/15 (stretch).png", 
			OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,1/2;diffusealpha,0;sleep,1/2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		};

	},

	Def.ActorFrame{

		OnCommand=cmd(x,0;linear,self:GetChild(""):GetWidth()*2;x,-160;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On");

			LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/4 4x1.png", 1/4, ScaleVar, true )..{ 

				OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar x,self:GetChild("template"):GetWidth()/2*ScaleVar ) 

			},

	},
	
}