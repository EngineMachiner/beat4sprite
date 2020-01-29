
local tempo = ...

if not tempo then 
	tempo = 1
end

local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

		Def.Sprite{
		Texture = "/BGAnimations/Backgrounds/5th/1 (stretch).png", 
		OnCommand=cmd(Center;zoom,4*ScaleVar;customtexturerect,0,0,4,4)
	},

		Def.Sprite{
		OnCommand=function(self)
			self:Load("/BGAnimations/Sprites/5th/Leave.png","(stretch)")
			self:Center()
				:zoom(6*ScaleVar)
				:customtexturerect(0,0,6,6)
		end
	},

		Def.Sprite{
		OnCommand=function(self)
			self:Load("/BGAnimations/Backgrounds/5th/62 (stretch).png")
			self:Center()
				:zoom(4*ScaleVar)
				:customtexturerect(0,0,4,4)
				:diffusealpha(1)
				:sleep(tempo)
				:diffusealpha(0)
				:sleep(tempo)
				:queuecommand("On")
			self:set_tween_uses_effect_delta(true):effectclock("beat")
			ToolPreview(self)
		end
	},

		Def.Sprite{
		OnCommand=function(self)
			self:Load("/BGAnimations/Sprites/5th/Flower.png","(stretch)")
			self:Center()
				:zoom(6*ScaleVar)
				:customtexturerect(0,0,6,6)
				:diffusealpha(1)
				:sleep(tempo)
				:diffusealpha(0)
				:sleep(tempo)
				:queuecommand("On")
			self:set_tween_uses_effect_delta(true):effectclock("beat")
			ToolPreview(self)
		end
	}

}