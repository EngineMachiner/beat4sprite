local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child)child:visible(false):finishtweening()end,{})
	end,

Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.Black)
		end,
	},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*28)*ScaleVar):diffuseshift():effectcolor1(Color.HoloGreen):effectperiod(4):effectcolor2(color("#ef40e5")):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*24)*ScaleVar):diffuseshift():effectcolor1(Color.Blue):effectperiod(4):effectcolor2(Color.Yellow):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*20)*ScaleVar):diffuseshift():effectcolor1(Color.Orange):effectperiod(4):effectcolor2(Color.Red):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*16)*ScaleVar):diffuseshift():effectcolor1(Color.Green):effectperiod(4):effectcolor2(Color.Purple):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*12)*ScaleVar):diffuseshift():effectcolor1(Color.Yellow):effectperiod(4):effectcolor2(Color.Green):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*8)*ScaleVar):diffuseshift():effectcolor1(Color.Red):effectperiod(4):effectcolor2(Color.Blue):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*4)*ScaleVar):diffuseshift():effectcolor1(Color.Green):effectperiod(4):effectcolor2(color("#ef40e5")):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1 color.png")..{
			OnCommand=function(self)
			self:Center():zoom(0.25*ScaleVar):diffuseshift():effectcolor1(color("#ef40e5")):effectperiod(4):effectcolor2(Color.Green):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/5A.png")..{
			OnCommand=function(self)
			self:Center():zoom(ScaleVar):blend("BlendMode_Normal"):rainbow():effectoffset(0.5):effectperiod(8):effectclock("beat")
			end
		},
}
