local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("B.lua", ScaleVar)..{
		OnCommand=cmd(y,-320*ScaleVar;linear,(35/3)/(8);y,0;queuecommand,"On";set_tween_uses_effect_delta,true)
	};
	LoadActor("B.lua", ScaleVar)..{
		OnCommand=cmd(y,0;linear,(35/3)/(8);y,320*ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true)
	};
	LoadActor("../Scripts/ParticlesUp", "Burn 2x1.png")..{},
}