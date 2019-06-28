local ScaleVar = _screen.h/480
local tbl = {
	
	"2 5x1.png",
	"1 5x1.png",
	"1 5x1.png",
	"2 5x1.png",
	"3 5x1.png",
	"4 5x1.png",
	"5 5x1.png",
	"5 5x1.png",
	"4 5x1.png"

}

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

	t[#t+1] = LoadActor("../Scripts/KaleidoscopeB","/BGAnimations/Backgrounds/5th/Kaleidoscopes/4 (stretch).png")..{}

for i = 1, 9 do
	t[#t+1] = Def.Sprite{
		Texture = tbl[i],
		OnCommand=function(self)

			self:xy( SCREEN_CENTER_X + self:GetWidth() * - ( - i + 5 ) * ScaleVar , SCREEN_CENTER_Y )
			self:zoom(ScaleVar):SetAllStateDelays(0.25):animate(false)
			self:queuecommand( "Repeat" )
			self:effectclock('beat')

			if i < 3 or i > 2 + 5 then
				self:sleep(1)
			end

		end,
		RepeatCommand=function(self)
			if i < 3 or i > 2 + 5 then
				self:rotationy(90):linear(1):rotationy(180):linear(1):rotationy(90)
			else
				self:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0)
			end
			self:queuecommand( "Repeat" )
		end
	}
end

return t