local bg = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	OnCommand=function(self)
		self:xy(0,100*ScaleVar)
	end,

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}
	
	for i = 0,8 do
		t[#t+1] = LoadActor("A.lua", bg)..{
			OnCommand=function(self)
				if i % 2 == 0 then
					self:x( 119 )
				end
				self:x((self:GetX()+35)*ScaleVar)
				self:y( 139 * 0.5 * i * ScaleVar )
				self:zoom(0.5)
			end
		}
	end

return t