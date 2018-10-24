local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
		LoadActor("../ParticleEffects/KaleidoscopeB","4 (stretch).png")..{
			OnCommand=function(self)
				self:xy(-ScaleVar^11.5,-ScaleVar^11)
			end
		},
		Def.Sprite{
		Texture = "1 5x1.png", 
		OnCommand=function(self)
		self:x(64*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:effectoffset(0.2)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = "2 5x1.png", 
		OnCommand=function(self)
		self:x((64+128)*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:effectoffset(0.4)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = "3 5x1.png", 
		OnCommand=function(self)
		self:x((64+256)*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:effectoffset(0.6)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = "4 5x1.png", 
		OnCommand=function(self)
		self:x((64+384)*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:effectoffset(0.8)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = "5 5x1.png", 
		OnCommand=function(self)
		self:x((64+512)*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = "1 5x1.png", 
		OnCommand=function(self)
		self:x((64+640)*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:effectoffset(0.2)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = "2 5x1.png", 
		OnCommand=function(self)
		self:x((64+768)*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:effectoffset(0.4)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
		Def.Sprite{
		Texture = "3 5x1.png", 
		OnCommand=function(self)
		self:x((64+896)*ScaleVar)
		:zoom(ScaleVar):SetAllStateDelays(0.25)
		:y(SCREEN_CENTER_Y)
		:effectoffset(0.6)
		:rotationy(0):linear(1):rotationy(90):linear(1):rotationy(0):queuecommand( "On" ):effectclock('beat')
		end
	};
}