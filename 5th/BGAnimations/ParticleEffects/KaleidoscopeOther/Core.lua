return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A.lua")..{
		OnCommand=cmd()
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22;y,-158)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22*4-25;y,-158*-1-45)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22*-2;y,-158*-2)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22*3-25;y,-158*-2-45)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22*-1;y,-158*-1)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22*3-25-45;y,-158+111)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22*3-25-68;y,-158-47)
	};
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-22*3-25+45;y,-158-159)
	};
}