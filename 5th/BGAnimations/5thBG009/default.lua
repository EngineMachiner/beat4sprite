local IsThereBG if GAMESTATE:GetCurrentSong():HasBackground() == true then 
	file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
		else file = "../Backgrounds/fallback.png"
		end;
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(file)..{
		OnCommand=function(self)
		self:Center()
		:SetSize(640*ScaleVar,480*ScaleVar)
		end;
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+640*ScaleVar;zoomx,-1)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-640*ScaleVar;zoomx,-1)
	};
		Def.Sprite{
		Texture = "1 2x1.png", 
		Frames = {{Delay= 1, Frame= 0}, {Delay= 1, Frame= 1}},
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;effectclock,"beat")
	};
		Def.Sprite{
		Texture = "1 2x1.png", 
		Frames = {{Delay= 1, Frame= 0}, {Delay= 1, Frame= 1}},
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+640*ScaleVar;zoomx,-1;effectclock,"beat")
	};
		Def.Sprite{
		Texture = "1 2x1.png", 
		Frames = {{Delay= 1, Frame= 0}, {Delay= 1, Frame= 1}},
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-640*ScaleVar;zoomx,-1;effectclock,"beat")
	};
};