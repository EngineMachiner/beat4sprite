local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
		Def.ActorFrame{

			Def.Sprite{
			Texture = "../Backgrounds/14 (stretch).png", 
			OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,2/2;diffusealpha,0;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		};
			Def.Sprite{
			Texture = "../Backgrounds/15 (stretch).png", 
			OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6;diffusealpha,1;sleep,1/2;diffusealpha,0;sleep,1/2;set_tween_uses_effect_delta,true;effectclock,"beat";queuecommand,"On")
		};

	},

	LoadActor("B.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetChild("template"):GetHeight()

			self:y(0+child_h*0.25)
			:linear(1.5*2.5*SCREEN_HEIGHT/child_h) --using Tool.lua in B.lua
			:y(-child_h*5+child_h*0.25)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
	LoadActor("B.lua")..{
		OnCommand=function(self)

			local child_h = self:GetChild(""):GetChild("template"):GetHeight()

			self:y(child_h*6+child_h*0.25)
			:linear(1.5*2.5*SCREEN_HEIGHT/child_h) --using Tool.lua in B.lua
			:y(child_h+child_h*0.25)
			:set_tween_uses_effect_delta(true)
			:effectclock("beat")
			:queuecommand("On")
		end
	};
}