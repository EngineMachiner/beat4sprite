return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(64)
			:y(64)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(192)
			:y(64)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(320)
			:y(64)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(448)
			:y(64)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(576)
			:y(64)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(704)
			:y(64)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(832)
			:y(64)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(64)
			:y(192)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(192)
			:y(192)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(320)
			:y(192)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(448)
			:y(192)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(576)
			:y(192)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(704)
			:y(192)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(832)
			:y(192)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(64)
			:y(320)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(192)
			:y(320)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(320)
			:y(320)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(448)
			:y(320)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(576)
			:y(320)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(704)
			:y(320)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(832)
			:y(320)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(64)
			:y(448)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(192)
			:y(448)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(320)
			:y(448)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(448)
			:y(448)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(576)
			:y(448)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(704)
			:y(448)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:x(832)
			:y(448)
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(0,0.075*7):effectclock('beat')
		end
	},

		LoadActor("../Sprites/ParticlesDown", "Round.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
		end

	},
}