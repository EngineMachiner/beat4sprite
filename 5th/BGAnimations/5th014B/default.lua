local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.ActorFrame{

		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/26 (stretch).png", 
			OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,2/2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		},
			
		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/25 (stretch).png", 
			OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;diffusealpha,1;sleep,1/2;diffusealpha,0;sleep,1/2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		},

		OnCommand=cmd(x,0;y,self:GetChild(""):GetHeight()/2;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;sleep,1/2;addx,-40*ScaleVar;addy,-40*ScaleVar;effectclock,"beat";queuecommand,"On")

	},

	LoadActor("../Scripts/InnerEffect/CircleIn", "/BGAnimations/Sprites/5th/Orange 2x1.png")..{}

}