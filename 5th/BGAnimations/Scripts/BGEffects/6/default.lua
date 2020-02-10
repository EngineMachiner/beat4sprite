local sprt = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end)
	end
	
}

for i = -1,1 do 
	if i ~= 0 then
		t[#t+1] = LoadActor(sprt)..{
			OnCommand=function(self)
				if i == -1 then 
					self:fadeleft(0.125)
				else
					self:faderight(0.125)
				end
				self:SetWidth(640)
				self:SetHeight(480)
				self:Center()
				self:zoomx(-1)
				self:x(self:GetX()-self:GetWidth()*-i)
			end
		}
	end
end

	t[#t+1] = LoadActor( "B.lua", sprt )..{}

return t