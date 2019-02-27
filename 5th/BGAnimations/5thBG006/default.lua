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
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;rainbow;effectperiod,8;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5)
	};
		LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;SetSize,640,480;rainbow;effectperiod,8;effectclock,'beat';effectoffset,0.5;blend,"BlendMode_Add";diffusealpha,0.5)
	};

	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;zoomx,-ScaleVar;SetSize,640,480;rainbow;effectperiod,8;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;x,self:GetX()+640*ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;zoomx,-ScaleVar;SetSize,640,480;rainbow;blend,"BlendMode_Add";effectperiod,8;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;x,self:GetX()+640*ScaleVar)
	};
	
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;zoomx,-ScaleVar;SetSize,640,480;rainbow;effectperiod,8;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;x,self:GetX()-640*ScaleVar)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;zoom,ScaleVar;zoomx,-ScaleVar;SetSize,640,480;rainbow;blend,"BlendMode_Add";effectperiod,8;effectclock,'beat';effectoffset,0.5;diffusealpha,0.5;x,self:GetX()-640*ScaleVar)
	};
}