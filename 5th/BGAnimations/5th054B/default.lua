local file = "/BGAnimations/Sprites/5th/FL2 2x1.png"
local file2 = "/BGAnimations/Sprites/5th/FL 2x1.png"
local ScaleVar = _screen.h/480

local Beats = { 2,4 }

local tempo = Beats[1]

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "../Backgrounds/5th/1 (stretch).png", 
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,2/2*tempo;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Sprites/5th/Leave (stretch).png", 
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,2/2*tempo;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "../Backgrounds/5th/62 (stretch).png", 
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,1/2*tempo;diffusealpha,0;sleep,1/2*tempo;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
		Def.Sprite{
		Texture = "/BGAnimations/Sprites/5th/Flower (stretch).png", 
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,1/2*tempo;diffusealpha,0;sleep,1/2*tempo;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
	};
}