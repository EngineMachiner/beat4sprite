BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then local SongBeat = (100*3)/BPM 
			else if BPM < 150 then local SongBeat = (100*6)/BPM
			end
		end

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoom,7;customtexturerect,0,0,7,7;rainbow;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*7;effectclock,'music')
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(y,-480;linear,SongBeat;y,-320;queuecommand,"On")
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(y,0;linear,SongBeat;y,160;queuecommand,"On")
	};
}