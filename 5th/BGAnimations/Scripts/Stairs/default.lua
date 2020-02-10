local ScaleVar = _screen.h/480
local sprite, dir = ...

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

				if dir then
					self:playcommand("Rainbow")
				end

				self:effectclock("beat")
				ToolPreview(self)
				AnimationDelay(self)
				self:zoom(ScaleVar)
				self:xy(SCREEN_CENTER_X-self:GetWidth()*i*ScaleVar+self:GetWidth()*n*ScaleVar-80*ScaleVar,
					SCREEN_CENTER_Y+self:GetHeight()*i*ScaleVar+60*ScaleVar)

			end,
			RainbowCommand=function(self)
				if dir == true then dir = 1 end
				self:rainbow():effectperiod(8)
				self:effectoffset(dir*n*0.75)				
			end,
			RainbowFallCommand=function(self)
				self:rainbow():effectperiod(8)
				self:effectoffset(-(-i*0.75+n))		
			end
		}
	end
end

return t