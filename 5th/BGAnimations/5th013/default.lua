local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Backgrounds/5th/22 (stretch).png")..{
		OnCommand=cmd(Center;zoom,18*ScaleVar;customtexturerect,0,0,12*ScaleVar,12*ScaleVar;x,-self:GetWidth()*ScaleVar)
	};
	LoadActor("../Scripts/BumpEffect","Star.png")..{},
}