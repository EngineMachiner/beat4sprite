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
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;diffusealpha,0.5)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;diffuseramp,effectcolor1,2,2,2,2,effectcolor2,1,1,1,1;effectclock,'beat';blend,"BlendMode_Add")
	};
	
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+640*ScaleVar;zoomx,-1;diffusealpha,0.5)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()+640*ScaleVar;zoomx,-1;diffuseramp,effectcolor1,2,2,2,2,effectcolor2,1,1,1,1;effectclock,'beat';blend,"BlendMode_Add")
	};
	
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-640*ScaleVar;zoomx,-1;diffusealpha,0.5)
	};
	LoadActor(file)..{
		OnCommand=cmd(Center;SetSize,640*ScaleVar,480*ScaleVar;x,self:GetX()-640*ScaleVar;zoomx,-1;diffuseramp,effectcolor1,2,2,2,2,effectcolor2,1,1,1,1;effectclock,'beat';blend,"BlendMode_Add")
	};
		LoadActor("../Scripts/ParticlesDownSpin/2", "/BGAnimations/Sprites/5th/Jewel.png", "/BGAnimations/Sprites/5th/Ring.png")..{},
}