return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("4.lua")..{
		OnCommand=function(self)
			self:effectclock('beat')
		end
	},
	LoadActor("../Sprites/BumpEffect/HeartTrevol/Trevol", "Trevol.png")..{
		OnCommand=function(self)
			self:rainbow()
		end
	},
	
	LoadActor("../Sprites/BumpEffect/HeartTrevol/Heart", "Heart.png")..{
		OnCommand=function(self) 
			self:rainbow():effectoffset(0.5)
			:addx(-30)
		end
	},
}