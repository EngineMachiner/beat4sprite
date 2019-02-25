return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Load(ENG_BG, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):addy(-60)
		:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(-0.125/5,-0.125/(2*5))
		:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Load(ENG_BG, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):addy(-30):addx(50):rotationz(60*2):rotationx(180)
		:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(-0.125/5,-0.125/(2*5))
		:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Load(ENG_BG, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):addy(28):addx(50):rotationz(-60):rotationx(180):rotationy(180)
		:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(-0.125/5,-0.125/(2*5))
		:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Load(ENG_BG, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):addy(58)
		:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(-0.125/5,-0.125/(2*5)):rotationx(180)
		:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Load(ENG_BG, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):addy(28):addx(-50):rotationz(60):rotationx(180):rotationy(-180)
		:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(-0.125/5,-0.125/(2*5))
		:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Load(ENG_BG, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):addy(-30):addx(-50):rotationz(60):rotationy(-180)
		:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(-0.125/5,-0.125/(2*5))
		:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end,
	};
}