return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
		end
	},
	
		LoadActor("../Sprites/ParticlesUpSpin", "2 2x2 Volt.png")..{
		OnCommand=function(self) 
			self:effectclock('beat')
			:blend("BlendMode_Add")
		end

	},

}