local ScaleVar = _screen.h/480
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Backgrounds/Tool.lua", "/BGAnimations/Sprites/1 5x1.png", 1/5, ScaleVar )..{},

}

for i=0,9 do
	if i ~= 5 then
		t[tostring(#t+1+i)] = LoadActor("../ParticleEffects/InnerEffect/CircleInSpin", "/BGAnimations/Sprites/head.png", true, i)..{}
	end
end

return t