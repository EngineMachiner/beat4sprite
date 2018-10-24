
local file, ScaleVar = ...

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

};

for i=-3,3 do

	t[i+4] = Def.Sprite{
			Name="Info",
			OnCommand=function(self)
			self:zoom(ScaleVar)
			self:Load(file, "stretch")
			self:xy(SCREEN_CENTER_X+self:GetWidth()*1.5*i,SCREEN_CENTER_Y)
			self:SetAllStateDelays(1/self:GetNumStates())
			self:effectclock("beat")
		end
	};

end

return t