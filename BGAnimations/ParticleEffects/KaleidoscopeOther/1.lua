return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Center():Load(ENG_BG, "stretch")
		:rotationz(45):zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(0,-0.0625/2):customtexturerect(0,0,320/10000,480/10000)
		:SetCustomPosCoords(0,0,0,-self:GetHeight()/2,-3*self:GetWidth()/4,-self:GetHeight()/2,-3*self:GetWidth()/4,self:GetHeight()/2)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Center():Load(ENG_BG, "stretch")
		:rotationz(0-45):rotationx(180):zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(0,-0.0625/2):customtexturerect(0,0,320/10000,480/10000)
		:SetCustomPosCoords(0,0,0,-self:GetHeight()/2,-3*self:GetWidth()/4,-self:GetHeight()/2,-3*self:GetWidth()/4,self:GetHeight()/2)
		end,
	};

	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Center():Load(ENG_BG, "stretch")
		:rotationz(45+127):addx(-69):addy(-22):zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(0,-0.0625/2):customtexturerect(0,0,320/10000,480/10000)
		:SetCustomPosCoords(0,0,0,-self:GetHeight()/2,-3*self:GetWidth()/4,-self:GetHeight()/2,-3*self:GetWidth()/4,self:GetHeight()/2)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Center():Load(ENG_BG, "stretch")
		:rotationz(0-45-127):addx(-69):addy(-22):rotationx(180):zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(0,-0.0625/2):customtexturerect(0,0,320/10000,480/10000)
		:SetCustomPosCoords(0,0,0,-self:GetHeight()/2,-3*self:GetWidth()/4,-self:GetHeight()/2,-3*self:GetWidth()/4,self:GetHeight()/2)
		end,
	};

	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Center():Load(ENG_BG, "stretch")
		:rotationz(45-127+10.675):addx(-69+48.5):addy(-22-32):zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(0,-0.0625/2):customtexturerect(0,0,320/10000,480/10000)
		:SetCustomPosCoords(0,self:GetHeight()/19,0,-self:GetHeight()/2,-5*self:GetWidth()/7.5,-self:GetHeight()/2,-5*self:GetWidth()/7.5,self:GetHeight()/2)
		end,
	};
	LoadActor(ENG_BG)..{
		OnCommand=function(self)
		self:Center():Load(ENG_BG, "stretch")
		:rotationz(0-45+127-10.675):addx(-69+48.5):addy(-22-32):rotationx(180):zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
		:texcoordvelocity(0,-0.0625/2):customtexturerect(0,0,320/10000,480/10000)
		:SetCustomPosCoords(0,self:GetHeight()/19,0,-self:GetHeight()/2,-5*self:GetWidth()/7.5,-self:GetHeight()/2,-5*self:GetWidth()/7.5,self:GetHeight()/2)
		end,
	};
	
}