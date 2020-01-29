local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Backgrounds/5th/DanceBackgrounds/2 1x4 .png", 1, 3 )..{ 
		OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75) 
	},

	Def.Quad{ 
		OnCommand=function(self)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:blend('BlendMode_InvertDest')
			self:diffuse(Color.White):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:effectclock("beat")
		end 
	}
	
}