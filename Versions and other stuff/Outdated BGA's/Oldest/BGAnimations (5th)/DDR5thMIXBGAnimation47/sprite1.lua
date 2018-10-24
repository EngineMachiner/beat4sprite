local t = Def.ActorFrame{
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,125;y,125;rotationz,245;zoom,2;sleep,0.5;x,425;y,425;rotationz,-245;zoom,2;sleep,0.5;x,125;y,125;rotationz,245;zoom,2)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,235;y,375;rotationz,341;zoom,2;sleep,0.5;x,125;y,425;rotationz,-45;zoom,1;sleep,0.5;x,235;y,375;rotationz,341;zoom,2)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,455;y,225;rotationz,-25;zoom,1;sleep,0.5;x,265;y,425;rotationz,425;zoom,2;sleep,0.5;x,455;y,225;rotationz,-25;zoom,1)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,65;y,335;rotationz,-255;zoom,1.5;sleep,0.5;x,325;y,125;rotationz,5;zoom,1.5;sleep,0.5;x,65;y,335;rotationz,-255;zoom,1.5)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,425;y,425;rotationz,-182;zoom,1.3;sleep,0.5;x,125;y,125;rotationz,165;zoom,1;sleep,0.5;x,425;y,425;rotationz,-182;zoom,1.3)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,475;y,55;rotationz,-95;zoom,1.5;sleep,0.5;x,225;y,125;rotationz,-658;zoom,1;sleep,0.5;x,475;y,55;rotationz,-95;zoom,1.5)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,405;y,165;rotationz,-155;zoom,0.5;sleep,0.5;x,315;y,225;rotationz,-845;zoom,1;sleep,0.5;x,405;y,165;rotationz,-155;zoom,0.5)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,385;y,305;rotationz,-327;zoom,0.5;sleep,0.5;x,325;y,325;rotationz,-245;zoom,1.5;sleep,0.5;x,385;y,305;rotationz,-327;zoom,0.5)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,265;y,235;rotationz,-305;zoom,1.7;sleep,0.5;x,355;y,425;rotationz,545;zoom,2;sleep,0.5;x,265;y,235;rotationz,-305;zoom,1.7)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,325;y,95;rotationz,-275;zoom,0.7;sleep,0.5;x,535;y,125;rotationz,-95;zoom,1.4;sleep,0.5;x,325;y,95;rotationz,-275;zoom,0.7)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,525;y,315;rotationz,221;zoom,0.7;sleep,0.5;x,575;y,225;rotationz,-135;zoom,1.7;sleep,0.5;x,525;y,315;rotationz,221;zoom,0.7)
	};
	LoadActor("2 2x1")..{
		OnCommand=cmd(rainbow;x,525;y,257;rotationz,138;zoom,0.7;sleep,0.5;x,555;y,325;rotationz,-725;zoom,1.3;sleep,0.5;x,525;y,257;rotationz,138;zoom,0.7)
	};
};

return t;