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
		OnCommand=function(self)
		self:Center()
			:zoom(ScaleVar)
			:zoomx(-ScaleVar)
			:SetSize(640,480)
			:x(self:GetX()+self:GetWidth()*ScaleVar)
			:faderight(0.025)
		end
	};
	
	LoadActor(file)..{
		OnCommand=function(self)
		self:Center()
			:zoom(ScaleVar)
			:zoomx(-ScaleVar)
			:SetSize(640,480)
			:x(self:GetX()-self:GetWidth()*ScaleVar)
			:fadeleft(0.025)
		end
	};

	LoadActor("B.lua", ScaleVar)..{};
	
}