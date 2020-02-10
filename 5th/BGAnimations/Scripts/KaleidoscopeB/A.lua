local bg = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

	for i = -1,2 do
		t[#t+1] = LoadActor( "1.lua", bg )..{
			OnCommand=function(self)
				self:y( - 520 * ScaleVar )
				self:x( 476 * i * ScaleVar )
			end
		}
	end

return t