return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:set_use_effect_clock_for_texcoords(true)
			:texcoordvelocity(-0.075*2,0):effectclock('beat')
			:diffusealpha(0.5)
		end
	},
	
	
	-- load BGAniamtion 4 using stars
	LoadActor("../Sprites/BumpEffect/BlendModeAdd", "star.png")..{
		OnCommand=function(self)
			self:blend(Blend.Add)
			:rainbow():effectoffset(0.5)
		end
	},
	
	LoadActor("../Sprites/BumpEffect/BlendModeAdd", "star.png")..{
		OnCommand=function(self) 
			self:x(640)
				:rainbow():effectoffset(1)
				:blend(Blend.Add)
		end
	}
}