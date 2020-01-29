local ScaleVar = _screen.h/480

return Def.ActorFrame{	
	Def.Quad{
		OnCommand=function(self)
			self:Center()
			self:zoomto( SCREEN_WIDTH, SCREEN_HEIGHT )
			self:diffuse(Color.Black)
			self:diffusealpha(0.5)
		end
	}
}