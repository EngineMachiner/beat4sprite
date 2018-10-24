return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;rainbow;effectclock,'music';effectoffset,0.5)
	};
	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;rainbow;effectclock,'music';blend,"BlendMode_Add")
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*2)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*4)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*6)
	};
	LoadActor("DiceSpace")..{
		OnCommand=cmd(diffusealpha,0.25;addy,56*8)
	};
}