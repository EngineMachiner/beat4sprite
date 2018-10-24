local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
		self:Center()
			:zoom(ScaleVar)
			:SetSize(640,480)
			:faderight(0.025)
			:fadeleft(0.025)
			
		end
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
		self:Center()
			:x(self:GetX()+self:GetWidth()*ScaleVar)
			:zoom(ScaleVar)
			:zoomx(-1)
			:SetSize(640,480)
			:faderight(0.025)
			
		end
	};
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
		self:Center()
			:x(self:GetX()-self:GetWidth()*ScaleVar)
			:zoom(ScaleVar)
			:zoomx(-1)
			:SetSize(640,480)
			:fadeleft(0.025)
		end
	};
}