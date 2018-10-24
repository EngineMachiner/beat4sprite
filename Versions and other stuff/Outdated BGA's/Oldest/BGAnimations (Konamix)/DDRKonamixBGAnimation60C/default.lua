local t = Def.ActorFrame{
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;addx,65;zoom,6;customtexturerect,0,0,6,6;rainbow;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*6;effectclock,'music')
	};
	LoadActor("2 (stretch)")..{
		OnCommand=cmd(Center;addx,65;zoom,6;customtexturerect,0,0,6,6;rainbow;effectoffset,0.25;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*6;effectclock,'music')
	};
	LoadActor("3 (stretch)")..{
		OnCommand=cmd(Center;addx,65;zoom,6;customtexturerect,0,0,6,6;rainbow;effectoffset,0.5;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*6;effectclock,'music')
	};
	LoadActor("4 (stretch)")..{
		OnCommand=cmd(Center;addx,65;zoom,6;customtexturerect,0,0,6,6;effectoffset,0.75;rainbow;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,-0.075*6;effectclock,'music')
	};
	LoadActor("Sprout")..{
		OnCommand=function(self)
			self:x(0)
		end
	},
};

return t;