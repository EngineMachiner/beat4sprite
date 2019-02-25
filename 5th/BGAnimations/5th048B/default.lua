local Color1 = color("0,0,1,1")
local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	Def.Quad{
		OnCommand=cmd(Center;SetSize,SCREEN_WIDTH,SCREEN_HEIGHT;diffuseramp;effectcolor1,color("#00ffff");effectcolor2,color("#008b8b");effectclock,'beat';effectperiod,0.5;set_tween_uses_effect_delta,true)
	};
	LoadActor("../Backgrounds/52 (stretch).png")..{
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8;zwrite,true;blend,'BlendMode_NoEffect')
	};
	LoadActor("../Backgrounds/53 (stretch).png")..{
		OnCommand=function(self)

			local relative_posy = (self:GetHeight()/2)/self:GetHeight()
			local texcoordvelocity_y = relative_posy/4
				
			self:Center()
			:zoom(8*ScaleVar)
			:texcoordvelocity(0,0.535*texcoordvelocity_y*(2*480/self:GetHeight())) --exception
			:customtexturerect(0,0,8,8)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(0,self:GetHeight()/4):ztest(true)
			:effectclock('beat')
		end	
	};
}