local ScaleVar = _screen.h/480
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

	t[#t+1] = LoadActor( "../Scripts/BGExtender", "/BGAnimations/Backgrounds/5th/41 (stretch).png", 2 )..{}

	t[#t+1] = Def.Quad{ 
		OnCommand=function(self)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:blend('BlendMode_InvertDest') 
			self:diffuse(Color.White):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT) 
		end 
	}
	
	t[#t+1] = LoadActor("B.lua")..{
			OnCommand=cmd(y,12)
	}

return t