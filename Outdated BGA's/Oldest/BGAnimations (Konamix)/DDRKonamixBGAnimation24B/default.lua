return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("3")..{
		OnCommand=cmd()
	};
	LoadActor("3")..{
		OnCommand=cmd(addx,640)
	};
	LoadActor("3")..{
		OnCommand=cmd(addx,-640)
	};
	LoadActor("../Sprites/RandomPosSprite/Pixie", "1")..{
		OnCommand=function(self)
		self:effectclock('beat')
		end
	},
}