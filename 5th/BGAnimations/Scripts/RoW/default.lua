local rainbow = ...

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

	t[#t+1] = Def.Sprite{ 
		OnCommand=function(self)
			self:Load(rainbow)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:effectclock("beat"):blend('BlendMode_Add'):diffusealpha(0.5*0.5)
		end 
	}

	t[#t+1] = Def.Quad{ 
		OnCommand=function(self)
			self:diffuse(Color.White)
			self:xy( SCREEN_CENTER_X , SCREEN_CENTER_Y )
			self:diffusealpha(0.75*0.5*0.5):blend('BlendMode_Add')
			self:rainbow():effectperiod(8)
			self:zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			self:effectclock("beat")	 
		end 
	}

return t