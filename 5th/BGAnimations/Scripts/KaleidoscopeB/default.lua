
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}
	
	for i = -4,4 do
		t[#t+1] = LoadActor("Core.lua")..{
			OnCommand=function(self)
				self:x( 119 * i * ScaleVar )
				self:y( 69 * i * ScaleVar )
			end
		}
	end

return t