local file2 = "../Backgrounds/61 (stretch).png"
local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor(file2)..{
		OnCommand=function(self)

				local relative_posx = (self:GetWidth()/2)/self:GetWidth()
				local texcoordvelocity_x = relative_posx/4
				
		self:Center()
			:zoom(3*ScaleVar)
			:texcoordvelocity(0.5*texcoordvelocity_x*(640/1280),0) --exception as 1280 should be the max dimension
			:customtexturerect(0,0,3,3)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end
	},
}