local ScaleVar = _screen.h/480
local sprite, rainbow = ...

local tbl = {}

local count = 1
local count_2 = nil

local t = Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end
}

for n=-9,9 do
	for i=-5,5 do
		t[#t+1] = Def.Sprite{
			OnCommand=function(self)
				
				if type(sprite) == "table" then
					if count > #sprite then 
						count = 1
					end
					if count_2 ~= n or not count_2 then
						count = count + 1
					end
					self:Load(sprite[count])
					count_2 = n
				else
					self:Load(sprite)
				end	

				if rainbow then
					self:rainbow():effectperiod(8)
					self:effectoffset(n*0.25) 
				end

				self:effectclock("beat")
				ToolPreview(self)
				AnimationDelay(self)
				self:zoom(ScaleVar)
				self:xy(SCREEN_CENTER_X-self:GetWidth()*i+self:GetWidth()*n-80,SCREEN_CENTER_Y+self:GetHeight()*i+60)

			end
		}
	end
end

return t