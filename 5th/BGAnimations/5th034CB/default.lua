local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end	

}

	t[#t+1] = LoadActor( "../Scripts/BGExtender", "/BGAnimations/Backgrounds/5th/41 (stretch).png", 3 )..{}

	t[#t+1] = Def.Quad{ 
		OnCommand=function(self)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:blend('BlendMode_InvertDest')
			self:rainbow():effectperiod(8)
			self:diffuse(Color.White):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT) 
		end 
	}

	--t[#t+1] = LoadActor("../Scripts/RoW","/BGAnimations/Backgrounds/5th/Rainbow/Gradient4.png")..{}

return t