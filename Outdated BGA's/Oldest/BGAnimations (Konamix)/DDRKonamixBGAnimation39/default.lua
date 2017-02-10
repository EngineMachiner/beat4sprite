BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (600*3)/BPM 
			else if BPM < 150 then SongBeat = (600*6)/BPM
			end
		end

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("default - copia.lua")..{
		OnCommand=cmd(x,0;y,120;linear,SongBeat;x,240;addy,0;queuecommand,"On")
	};
	LoadActor("../Sprites/ParticlesDownSpin/BlendModeAdd", "Square2.png")..{
		OnCommand=cmd()
	};
}