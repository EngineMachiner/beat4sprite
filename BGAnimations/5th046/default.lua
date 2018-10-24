local file = "../Sprites/sparks 1x2.png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/6 (stretch).png")..{
		OnCommand=cmd(Center;zoom,6*ScaleVar;customtexturerect,0,0,6,6)
	};
		Def.Sprite{
		Texture = file,
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*320;y,60*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*960;y,60*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*320;y,180*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*960;y,180*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*320;y,300*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*960;y,300*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*320;y,420*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*960;y,420*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*320;y,540*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
		Def.Sprite{
		Texture = file, 
		OnCommand=cmd(SetAllStateDelays,0.5;zoom,ScaleVar;x,ScaleVar*960;y,540*ScaleVar;diffusealpha,0;sleep,4;diffusealpha,1;sleep,12;diffusealpha,0;effectclock,"beat";set_tween_uses_effect_delta,true;queuecommand,"On")
	};
	LoadActor("../Backgrounds/47 (stretch).png")..{
		OnCommand=function(self)

		local relative_posy = (self:GetHeight()/2)/self:GetHeight()
		local texcoordvelocity_y = relative_posy/4
				
			self:Center()
			:zoom(5*ScaleVar)
			:texcoordvelocity(0,texcoordvelocity_y*(2*480/self:GetHeight()))
			:customtexturerect(0,0,5,5)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4)
			:effectclock('beat'):diffusealpha(0):sleep(8):diffusealpha(1):sleep(8):diffusealpha(0):queuecommand("On"):set_tween_uses_effect_delta(true)
		end
	};
		Def.Sprite{
		Texture = "5 5x1.png", 
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X-self:GetWidth()*ScaleVar*3)
		:y(SCREEN_CENTER_Y)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:effectoffset(0.4)
		:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0):queuecommand( "On" ):effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	};
		Def.Sprite{
		Texture = "1 5x1.png", 
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X-self:GetWidth()*ScaleVar*2)
		:y(SCREEN_CENTER_Y)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:effectoffset(0.2)
		:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0):queuecommand( "On" ):effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	};
		Def.Sprite{
		Texture = "2 5x1.png", 
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X-self:GetWidth()*ScaleVar)
		:y(SCREEN_CENTER_Y)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:effectoffset(0.4)
		:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0):queuecommand( "On" ):effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	};
		Def.Sprite{
		Texture = "3 5x1.png", 
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X-self:GetWidth()*ScaleVar*0)
		:y(SCREEN_CENTER_Y)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:effectoffset(0.6)
		:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0):queuecommand( "On" ):effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	};
		Def.Sprite{
		Texture = "4 5x1.png", 
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X+self:GetWidth()*ScaleVar)
		:y(SCREEN_CENTER_Y)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:effectoffset(0.8)
		:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0):queuecommand( "On" ):effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	};
		Def.Sprite{
		Texture = "5 5x1.png", 
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X+self:GetWidth()*ScaleVar*2)
		:y(SCREEN_CENTER_Y)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0):queuecommand( "On" ):effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	};
		Def.Sprite{
		Texture = "1 5x1.png", 
		OnCommand=function(self)
		self:x(SCREEN_CENTER_X+self:GetWidth()*ScaleVar*3)
		:y(SCREEN_CENTER_Y)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:effectoffset(0.2)
		:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0):queuecommand( "On" ):effectclock('beat'):set_tween_uses_effect_delta(true)
		end
	};
}