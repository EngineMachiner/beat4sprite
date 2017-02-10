return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 4x2.png")..{
		OnCommand=cmd(x,0;y,0;effectclock,'beat')
	};
}