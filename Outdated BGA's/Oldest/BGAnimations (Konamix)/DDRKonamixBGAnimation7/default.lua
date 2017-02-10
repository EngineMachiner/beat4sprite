return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,-2.25):effectclock('beat')
			:diffuse(color("#FF0000"))
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(60)
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")

		end
	},

	
	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(60)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(60)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(60)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(60)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(60)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(60)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(180)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(180)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(180)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(180)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(180)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(180)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(180)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(300)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(300)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(300)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(300)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(300)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(300)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(300)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(420)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(420)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(420)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(420)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(420)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(420)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("2 5x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(420)
			:effectclock('music')
			:rotationx(90):linear(1):rotationx(-90):linear(1):rotationx(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},
}