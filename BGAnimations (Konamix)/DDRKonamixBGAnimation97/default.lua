local BPM = GAMESTATE:GetSongPosition():GetCurBPS()
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,9;customtexturerect,0,0,9,9;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*4.5;effectclock,'beat';diffuse,color("#00FFFF"))
	};
	LoadActor("../Sprites/ParticlesUpSpin", "Figure.png")..{
		OnCommand=cmd()
	};
}