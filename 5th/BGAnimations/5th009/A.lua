local ScaleVar = _screen.h/480
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

}

for i=-1,6 do
	t[#t+1] = Def.Quad{
		OnCommand=function(self)

			if i == 0 then self:diffusealpha(0) end

			if i == -1 then 
				self:x( - 80 * ScaleVar )
				self:y( 0 )
			else 
				self:x( 80 * ScaleVar + 160 * ( i - 1 ) * ScaleVar )
				self:y( 120 * i * ScaleVar )
			end

			
			self:zoomto( 160 * ScaleVar , 120 * ScaleVar )
				:diffuse(Color.Red)

		end
	}
end

return t