
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

for i=-9,9,2 do
	t[#t+1] = LoadActor("A.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
			:x(80*i*ScaleVar)
			:diffuseshift()
			:effectoffset( - ((i*0.5) + 4) )
			:effectperiod(4)
			:effectcolor1(Color.Red)
			:effectcolor2(0,0,0,0)
			:diffusealpha(0.5)
		end
	}
end

return t