local bg = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	OnCommand=function(self)
		self:xy(0,100)
	end,

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}
	
	for i = -4,4 do
		t[#t+1] = LoadActor("A.lua", bg)..{
			OnCommand=function(self)
				self:x( 118 * i * ScaleVar )
				self:y( 71 * i * ScaleVar )
				self:zoom(0.5*ScaleVar)
			end
		}
	end

return t