
local Color1 = color("0,0,1,1")

local ScaleVar = _screen.h/480

return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("/BGAnimations/Backgrounds/5th/54 (stretch)")..{
		OnCommand=function(self)
		
		BGA_TCV_OrL(self, 0.5, 0)

		self:Center()
			:zoom(1*ScaleVar)
			:customtexturerect(0,0,1,1)
			:set_use_effect_clock_for_texcoords(true)
			:effectclock('beat')
		end	
	},

	LoadActor("/BGAnimations/Backgrounds/5th/52 (stretch).png")..{
		OnCommand=cmd(Center;zoom,8*ScaleVar
			;customtexturerect,0,0,8,8
			;zwrite,true
			;blend,'BlendMode_NoEffect')
	},

	LoadActor("/BGAnimations/Backgrounds/5th/53 (stretch).png")..{
		OnCommand=function(self)

			BGA_TCV_OrL(self, 0, 1)
			self:Center()
			:zoom(8*ScaleVar)
			:customtexturerect(0,0,8,8)
			:set_use_effect_clock_for_texcoords(true)
			:ztest(true)
			:effectclock('beat')

		end	
	}

}