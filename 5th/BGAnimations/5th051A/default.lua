
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/55 (stretch).png")..{
		OnCommand=cmd(Center;x,self:GetX()+75;zoom,11*ScaleVar
			;customtexturerect,0,0,11,11;cropbottom,0.3;croptop,0.3;cropright,0.25
			;cropleft,0.175)
	},

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/mushroom.png", 4, 2)..{ 
		OnCommand=function(self)
			self:y(self:GetChild("template"):GetHeight()*ScaleVar/1.75)
			self:x(self:GetChild("template"):GetWidth()*ScaleVar/2)
			self:queuecommand("SpinX")
		end
 	},

}