local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

		LoadActor("A.lua")..{},
		LoadActor("A.lua")..{ OnCommand=function(self) self:x(self:GetX()+self:GetWidth()*ScaleVar) end },
		LoadActor("A.lua")..{ OnCommand=function(self) self:x(self:GetX()-self:GetWidth()*ScaleVar) end },
	
}