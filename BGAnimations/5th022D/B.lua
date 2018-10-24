return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		LoadActor("A.lua")..{
		OnCommand=cmd(Center)
	};
		LoadActor("A.lua")..{
		OnCommand=cmd(Center;addx,640)
	};
		LoadActor("A.lua")..{
		OnCommand=cmd(Center;addx,-640)
	};
}