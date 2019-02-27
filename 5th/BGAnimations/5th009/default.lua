local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	Def.Sprite{ 
		Texture="/BGAnimations/Backgrounds/5th/6 (stretch).png";	
		OnCommand=function(self)
			self:Center()
			:zoom(7*ScaleVar)
			:customtexturerect(0,0,7,7)
			:xy(160*2*ScaleVar,120*2*ScaleVar):linear((35/3)*2):xy(-160*2*ScaleVar,-120*2*ScaleVar):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
			
		end
	},
	Def.Sprite{ 
		Texture="/BGAnimations/Backgrounds/5th/6 (stretch).png";	
		OnCommand=function(self)
			self:Center()
			:zoom(7*ScaleVar)
			:customtexturerect(0,0,7,7)
			:xy(160*6*ScaleVar,120*6*ScaleVar):linear((35/3)*2):xy(160*2*ScaleVar,120*2*ScaleVar):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
			
		end
	},
	Def.Sprite{ 
		Texture="/BGAnimations/Backgrounds/5th/6 (stretch).png";	
		OnCommand=function(self)
			self:Center()
			:zoom(7*ScaleVar)
			:customtexturerect(0,0,7,7)
			:xy(160*6*ScaleVar,120*2*ScaleVar):linear((35/3)*2):xy(160*2*ScaleVar,-120*2*ScaleVar):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
			
		end
	},
	Def.Sprite{ 
		Texture="/BGAnimations/Backgrounds/5th/6 (stretch).png";	
		OnCommand=function(self)
			self:Center()
			:zoom(7*ScaleVar)
			:customtexturerect(0,0,7,7)
			:xy(160*2*ScaleVar,120*6*ScaleVar):linear((35/3)*2):xy(-160*2*ScaleVar,120*2*ScaleVar):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
			
		end
	},
	LoadActor("B.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
			:xy(0,0):linear((8.75)*2):xy(-120*(2)*2*ScaleVar,-120*(1.5)*2*ScaleVar):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
		end
	},
	LoadActor("B.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
			:xy(120*(2)*2*ScaleVar,120*(1.5)*2*ScaleVar):linear((8.75)*2):xy(0,0):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
		end
	},

		LoadActor("../Scripts/Line", "/BGAnimations/Sprites/5th/2 Sun 2x1.png", 1/2, ScaleVar)..{},

}
