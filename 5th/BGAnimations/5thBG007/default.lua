local IsThereBG if GAMESTATE:GetCurrentSong():HasBackground() == true then 
	file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
		else file = "/BGAnimations/Backgrounds/fallback.png"
		end;
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()+640*ScaleVar;zoomx,-1)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;x,self:GetX()-640*ScaleVar;zoomx,-1)
	};
	Def.Sprite{
		Texture = "1 2x1.png", 
		Frames = {{Delay= 1, Frame= 0}, {Delay= 1, Frame= 1}},
		OnCommand=function(self)
			self:Center()
			:zoom(ScaleVar)
			:effectclock("beat")
			end;
	};
	Def.Sprite{
		Texture = "1 2x1.png", 
		Frames = {{Delay= 1, Frame= 0}, {Delay= 1, Frame= 1}},
		OnCommand=function(self)
			self:Center()
			:zoom(ScaleVar)
			:x(self:GetX()+self:GetWidth()*ScaleVar)
			:zoomx(-ScaleVar)
			:effectclock("beat")
			end;
	};
	Def.Sprite{
		Texture = "1 2x1.png", 
		Frames = {{Delay= 1, Frame= 0}, {Delay= 1, Frame= 1}},
		OnCommand=function(self)
			self:Center()
			:zoom(ScaleVar)
			:x(self:GetX()-self:GetWidth()*ScaleVar)
			:zoomx(-ScaleVar)
			:effectclock("beat")
			end;
	};

}