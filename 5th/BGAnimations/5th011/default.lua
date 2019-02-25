local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("../Backgrounds/16 (stretch).png")..{
		OnCommand=cmd(Center;zoom,8*ScaleVar;customtexturerect,0,0,8,8)
	};
	LoadActor("../Backgrounds/Tool.lua", "../Sprites/4 4x1.png", 1/4, ScaleVar, true )..{ OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar x,self:GetChild("template"):GetWidth()/2*ScaleVar ) },
}