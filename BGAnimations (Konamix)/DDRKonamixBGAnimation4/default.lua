return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(60)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(60)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(60)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(60)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(60)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(60)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(60)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(180)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(180)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(180)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(180)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(180)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(180)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(180)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(300)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(300)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(300)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(300)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(300)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(300)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(300)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(420)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(420)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(420)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(420)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(420)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(420)
			:effectclock('music')
		end
	},

	LoadActor("1 7x1.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(420)
			:effectclock('music')
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(60)
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
			:effectclock('music')

		end
	},

	
	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(60)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(60)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(60)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("d.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(60)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(60)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(60)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(180)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(180)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(180)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(180)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("d.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(180)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(180)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(180)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(300)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(300)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(300)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(300)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("d.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(300)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(300)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(300)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(64)
			:y(420)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(192)
			:y(420)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(320)
			:y(420)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("e.png")..{
		OnCommand=function(self)
			self:x(448)
			:y(420)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("d.png")..{
		OnCommand=function(self)
			self:x(576)
			:y(420)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("s.png")..{
		OnCommand=function(self)
			self:x(704)
			:y(420)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},

	LoadActor("p.png")..{
		OnCommand=function(self)
			self:x(832)
			:y(420)
			:effectclock('music')
			:rotationy(90):linear(1):rotationy(-90):linear(1):rotationy(90):queuecommand( "On" ):effectclock('beat')
			:blend("BlendMode_Add")
		end
	},
}
