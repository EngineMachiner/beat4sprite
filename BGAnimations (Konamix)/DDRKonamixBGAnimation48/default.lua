return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1.png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:rainbow():effectclock('music'):effectoffset(0.5)
		end
	},
	LoadActor("1.png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
				:rainbow():effectclock('music'):blend(Blend.Add)
		end
	},
	
	
	-- load BGAniamtion 4 using hearts
	LoadActor("../Sprites/BumpEffect/BlendModeAdd", "Heart")..{
		OnCommand=function(self)  self:rainbow() end
	},
	LoadActor("../Sprites/BumpEffect/BlendModeAdd", "Heart")..{
		OnCommand=function(self)
			self:x(640)
				:rainbow():effectclock('beat')
		end
	},
}