local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/Stairs", "/BGAnimations/Sprites/5th/1 2x2.png", true )..{
		OnCommand=function(self)
			self:playcommand("RainbowFall")
		end
	}
}

	t[#t+1] = Def.Quad{ 
		OnCommand=function(self)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:blend('BlendMode_InvertDest')
			self:diffuse(Color.White):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:effectclock("beat")
		end 
	}

return t