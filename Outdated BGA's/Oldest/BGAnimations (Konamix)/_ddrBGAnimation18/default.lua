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
	},	--#ffb400 Yellow - #b000ff Purple

		LoadActor("../Sprites/ParticlesUpSpin", "Square.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:diffuse(color("#ffb400"))
		end
	},

		LoadActor("../Sprites/ParticlesUpSpin", "Square.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:diffuse(color("#b000ff"))
		end
	},

}