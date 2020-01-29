local ScaleVar = _screen.h/480

local Backgrounds = {

	"/BGAnimations/Backgrounds/5th/26 (stretch).png",
	"/BGAnimations/Backgrounds/5th/25 (stretch).png"

}

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/AnimatedCTR",Backgrounds)..{

		OnCommand=function(self)
			self:playcommand("Move")
		end,

		MoveCommand=function(self)
			self:xy(0,0)
			self:set_tween_uses_effect_delta(true)
			self:effectclock("beat")
			self:sleep(2)
				:xy( self:GetX()-40*ScaleVar, self:GetY()-40*ScaleVar )
				:sleep(2)
				:xy( self:GetX()-40*2*ScaleVar, self:GetY()-40*2*ScaleVar )
				:sleep(2)
				:xy( self:GetX()-40*3*ScaleVar, self:GetY()-40*3*ScaleVar )
				:sleep(2)
				:queuecommand("Move")
				ToolPreview(self)
		end

	},

	LoadActor("../Scripts/InnerEffect/CircleIn", "/BGAnimations/Sprites/5th/Orange 2x1.png")..{}

}