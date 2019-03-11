local file = ...

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

for i = -1,1 do
	t[#t+1] = LoadActor(file)..{
		OnCommand=function(self)
			self:SetAllStateDelays(self:GetNumStates()):effectclock('beat')
			self:Center()
			:zoom(ScaleVar)
			:SetSize(640,480)
			:x(self:GetX()+self:GetWidth()*ScaleVar*i)
			if i ~= 0 then
				self:zoomx(-ScaleVar)
			else
				self:zoomx(ScaleVar)
			end
		end
	}
end

return t