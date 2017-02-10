return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("BGSongKaleidoscope.lua")..{
		OnCommand=function(self)
		self:hibernate(4)
		:diffuse(color("#000FFF"))
	end
	},

	LoadActor("BGSongKaleidoscope.lua")..{
		OnCommand=function(self)
		self:hibernate(2)
		:diffuse(color("#000FFF"))
	end
	},

	LoadActor("BGSongKaleidoscope.lua")..{
		OnCommand=function(self)
		self:diffuse(color("#000FFF"))
	end
	},

		LoadActor("../Sprites/ParticlesUpSpin", "2 14x1 Lights.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:rainbow():effectoffset(0.5)
		end
	},

		LoadActor("../Sprites/ParticlesUpSpin", "2 14x1 Lights.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:rainbow()
		end
	},

}