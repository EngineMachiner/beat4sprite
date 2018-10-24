return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;set_use_effect_clock_for_texcoords,true;texcoordvelocity,-0.075*2,0;effectclock,'beat')
	};
	LoadActor("1.lua")..{
		OnCommand=cmd()
	};
}