return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor(GAMESTATE:GetCurrentSong():GetBackgroundPath())..{
		OnCommand=function(self)
			self:Center():FullScreen()
			:diffuse(color("#ff0000"))
			:linear(1)
			:diffuse(color("#008000"))
			:queuecommand("On")
		end
	},
	
	LoadActor("1 (stretch)")..{
		OnCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;set_use_effect_clock_for_texcoords,true;texcoordvelocity,0,0.075*3;effectclock,'beat';diffuse,color("#ff0000");linear,1;diffuse,color("#008000");queuecommand,"On")
	};
}