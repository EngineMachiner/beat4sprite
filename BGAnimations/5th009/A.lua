local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Quad{
		OnCommand=cmd(x,-80*ScaleVar;y,0*ScaleVar;zoomto,160*ScaleVar,120*ScaleVar;diffuse,Color.Red);
	};
		Def.Quad{
		OnCommand=cmd(x,80*ScaleVar;y,120*ScaleVar;zoomto,160*ScaleVar,120*ScaleVar;diffuse,Color.Red);
	};
		Def.Quad{
		OnCommand=cmd(x,240*ScaleVar;y,240*ScaleVar;zoomto,160*ScaleVar,120*ScaleVar;diffuse,Color.Red)
	};
		Def.Quad{
		OnCommand=cmd(x,400*ScaleVar;y,360*ScaleVar;zoomto,160*ScaleVar,120*ScaleVar;diffuse,Color.Red)
	};
		Def.Quad{
		OnCommand=cmd(x,560*ScaleVar;y,480*ScaleVar;zoomto,160*ScaleVar,120*ScaleVar;diffuse,Color.Red)
	};
		Def.Quad{
		OnCommand=cmd(x,720*ScaleVar;y,600*ScaleVar;zoomto,160*ScaleVar,120*ScaleVar;diffuse,Color.Red)
	};
		Def.Quad{
		OnCommand=cmd(x,880*ScaleVar;y,720*ScaleVar;zoomto,160*ScaleVar,120*ScaleVar;diffuse,Color.Red)
	};
}
