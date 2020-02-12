local ScaleVar = _screen.h/480
local sprite, dir, color_val = ...

local tbl = {}

local count = 1
local count_2 = nil

local t = Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end
}

for n=-11,11 do
	for i=-8,8 do
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

				if self:GetX() < SCREEN_LEFT - self:GetWidth() * 4
				or self:GetX() > SCREEN_RIGHT + self:GetWidth() * 4
				or self:GetY() < SCREEN_TOP - self:GetHeight() * 3
				or self:GetY() > SCREEN_BOTTOM + self:GetHeight() * 3 then 
					self:visible(false)
				end

				if color_val then 
					self:playcommand("ColorChangeFall")
				end

			end,
			RainbowCommand=function(self)
				if dir == true then dir = 1 end
				self:rainbow():effectperiod(8)
				self:effectoffset(dir*n*0.75)				
			end,
			RainbowFallCommand=function(self)
				self:rainbow():effectperiod(8)
				self:effectoffset(-(-i*0.75+n))		
			end,
			ColorChangeFallCommand=function(self)
				self:diffuseshift()
				self:effectcolor1(color("1,1,1,1"))
				self:effectcolor2(color_val)
				self:effectperiod(8)
				self:effectoffset(-(-i*0.75+n))	
			end
		}
	end
end

return Def.ActorFrame{ t }