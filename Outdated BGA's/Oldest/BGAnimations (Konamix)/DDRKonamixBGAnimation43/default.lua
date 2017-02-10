return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("1 (stretch).png")..{
		OnCommand=function(self)
		self:zoom(10)
		:customtexturerect(0,0,7.5,7.5)
		:set_use_effect_clock_for_texcoords(true)
		:texcoordvelocity(0,-0.075*7.5):effectclock('beat')
		:Center()
		end
	},
	
		LoadActor("../Sprites/ParticlesDown", "2 5x4 Letters.png")..{
		OnCommand=function(self) 
		self:effectclock('beat')
		:blend("BlendMode_Add")
		:rainbow():effectclock('music')
		end

	},
}