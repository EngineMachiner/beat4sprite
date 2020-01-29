local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 2x2.png", 4, 2 )..{ 

		OnCommand=cmd( y,self:GetChild("template"):GetHeight()/2*ScaleVar x,self:GetChild("template"):GetWidth()/2*ScaleVar )

	}

}

	t[#t+1] = Def.Quad{ 
		OnCommand=function(self)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:blend('BlendMode_InvertDest')
			self:diffuse(Color.White):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT) 
		end 
	}

return t