local ScaleVar = _screen.h/480

return Def.ActorFrame{

	Def.Quad{
		OnCommand=function(self)
			self:diffuse(Color.Green)
			self:diffusealpha(0.5)
			if SCREENMAN:GetTopScreen():GetCurrentRowIndex('PlayerNumber_P1') == 10 then
				self:Center():x( self:GetX() - SCREEN_WIDTH )
				self:zoomto( SCREEN_WIDTH, SCREEN_HEIGHT )
				self:cropleft(0.5)
			else
				self:diffusealpha(0)
			end
		end
	},

	Def.Quad{
		OnCommand=function(self)
			self:diffuse(Color.Black)
			self:diffusealpha(0.5)
			if SCREENMAN:GetTopScreen():GetCurrentRowIndex('PlayerNumber_P1') == 10 then
				self:Center()
				self:zoomto( SCREEN_WIDTH, SCREEN_HEIGHT )
			end
		end
	},

	Def.Quad{
		OnCommand=function(self)
			self:diffuse(Color.Green)
			self:diffusealpha(0.5)
			if SCREENMAN:GetTopScreen():GetCurrentRowIndex('PlayerNumber_P1') == 10 then
				self:Center():x( self:GetX() + SCREEN_WIDTH )
				self:zoomto( SCREEN_WIDTH, SCREEN_HEIGHT )
				self:cropright(0.5)
			else
				self:diffusealpha(0)
			end
		end
	}

}