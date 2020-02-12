
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

	t[#t+1] = LoadActor( "../Scripts/BGExtender", GAMESTATE:GetCurrentSong():GetBackgroundPath() )..{}

	t[#t+1] = Def.Quad{ 
		OnCommand=function(self)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:blend('BlendMode_InvertDest')
			self:diffuse(Color.White):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:effectclock("beat")
		end 
	}

	t[#t+1] = LoadActor( "../Scripts/BGExtender", GAMESTATE:GetCurrentSong():GetBackgroundPath() )..{
		OnCommand=function(self)
			self:set_tween_uses_effect_delta(true):effectclock('beat')
			self:playcommand("Repeat")
			ToolPreview(self)
		end,
		RepeatCommand=function(self)
			self:diffusealpha(1):sleep(2):diffusealpha(0):sleep(2)
			self:queuecommand("On")
		end
	}


return t