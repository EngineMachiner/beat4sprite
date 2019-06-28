local bg = ...
local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.Sprite{
		OnCommand=function(self)
			self:Load(bg, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):y(self:GetY()-60)
			:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
			:texcoordvelocity(-0.125/5,-0.125/(2*5))
			:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end
	},

	Def.Sprite{
		OnCommand=function(self)
			self:Load(bg, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):y(self:GetY()-30)
			:x(self:GetX()+50):rotationz(60*2):rotationx(180)
			:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
			:texcoordvelocity(-0.125/5,-0.125/(2*5))
			:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end
	},

	Def.Sprite{
		OnCommand=function(self)
			self:Load(bg, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):y(self:GetY()+28)
			:x(self:GetX()+50):rotationz(-60):rotationx(180):rotationy(180)
			:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
			:texcoordvelocity(-0.125/5,-0.125/(2*5))
			:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end
	},

	Def.Sprite{
		OnCommand=function(self)
			self:Load(bg, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):y(self:GetY()+58)
			:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
			:texcoordvelocity(-0.125/5,-0.125/(2*5)):rotationx(180)
			:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end
	},

	Def.Sprite{
		OnCommand=function(self)
			self:Load(bg, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):y(self:GetY()+28)
			:x(self:GetX()+-50):rotationz(60):rotationx(180):rotationy(-180)
			:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
			:texcoordvelocity(-0.125/5,-0.125/(2*5))
			:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end
	},

	Def.Sprite{
		OnCommand=function(self)
			self:Load(bg, "stretch"):Center():customtexturerect(0,0,SCREEN_WIDTH/12500,SCREEN_WIDTH/12500):y(self:GetY()-30)
			:x(self:GetX()+-50):rotationz(60):rotationy(-180)
			:zoom(0.25):SetSize(640,640):set_use_effect_clock_for_texcoords(true):effectclock('beat')
			:texcoordvelocity(-0.125/5,-0.125/(2*5))
			:SetCustomPosCoords(0,0,self:GetWidth()/2,-self:GetWidth()/7,-self:GetWidth()/2,-self:GetWidth()/7.5,0,0)
		end
	},

}