local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		Def.Sprite{
		Texture = "/BGAnimations/Sprites/5th/3 5x1.png", 
		OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates()/2;zoom,ScaleVar;xy,128*ScaleVar+SCREEN_CENTER_X,SCREEN_CENTER_Y)
	};
		Def.Sprite{
		Texture = "/BGAnimations/Sprites/5th/3 5x1.png", 
		OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates()/2;zoom,ScaleVar;xy,128*ScaleVar+SCREEN_CENTER_X+128*ScaleVar,SCREEN_CENTER_Y-120*ScaleVar)
	};
		Def.Sprite{
		Texture = "/BGAnimations/Sprites/5th/3 5x1.png", 
		OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates()/2;zoom,ScaleVar;xy,128*ScaleVar+SCREEN_CENTER_X+128*ScaleVar*2,SCREEN_CENTER_Y-120*ScaleVar*2)
	};
		Def.Sprite{
		Texture = "/BGAnimations/Sprites/5th/3 5x1.png", 
		OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates()/2;zoom,ScaleVar;xy,128*ScaleVar+SCREEN_CENTER_X-128*ScaleVar,SCREEN_CENTER_Y+120*ScaleVar)
	};
		Def.Sprite{
		Texture = "/BGAnimations/Sprites/5th/3 5x1.png", 
		OnCommand=cmd(SetAllStateDelays,1/self:GetNumStates()/2;zoom,ScaleVar;xy,128*ScaleVar+SCREEN_CENTER_X-128*ScaleVar*2,SCREEN_CENTER_Y+120*ScaleVar*2)
	};
}