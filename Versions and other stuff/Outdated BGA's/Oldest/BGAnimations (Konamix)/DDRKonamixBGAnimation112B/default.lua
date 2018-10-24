BPM = GAMESTATE:GetSongPosition():GetCurBPS( )*60
	if BPM > 150 
		then SongBeat = (240*3)/BPM 
			else if BPM < 150 then SongBeat = (240*6)/BPM
			end
		end

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("2 1x4")..{
		OnCommand=cmd(x,320;y,120;zoom,2;effectclock,'music';diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ff00");linear,SongBeat;diffuse,color("#0000ff");queuecommand,"On")
	};
	LoadActor("3 1x4")..{
		OnCommand=cmd(x,320;y,360;zoom,2;effectclock,'music';diffuse,color("#0000ff");linear,SongBeat;diffuse,color("#00ff00");linear,SongBeat;diffuse,color("#0000ff");queuecommand,"On")
	};
	LoadActor("1 4x2")..{
		OnCommand=function(self)
			self:Center()
			:effectclock('beat')
			:diffuse(color("#00ff00"))
			:linear(SongBeat)
			:diffuse(color("#0000ff"))
			:linear(SongBeat)
			:diffuse(color("#00ff00"))
			:queuecommand("On")
			end
	};
}