local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("A.lua")..{};
	LoadActor("B.lua")..{};	
	LoadActor("C.lua")..{};	
	LoadActor("D.lua")..{};
	
	LoadActor("A.lua")..{
		OnCommand=cmd(x,128*4*ScaleVar)
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(x,128*4*ScaleVar)
	};	
	
	LoadActor("A.lua")..{
		OnCommand=cmd(x,-128*4*ScaleVar)
	};
	LoadActor("B.lua")..{
		OnCommand=cmd(x,-128*4*ScaleVar)
	};		
	LoadActor("C.lua")..{
		OnCommand=cmd(x,-128*4*ScaleVar)
	};	
	LoadActor("D.lua")..{
		OnCommand=cmd(x,-128*4*ScaleVar)
	};		
	
	LoadActor("D.lua")..{
		OnCommand=cmd(x,-128*8*ScaleVar)
	};		
}