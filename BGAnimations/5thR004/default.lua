local scripts = {
	"../5thR003B/default.lua",
	"../5thR003C/default.lua",
	"../5thR003D/default.lua",
	"../5thR003E/default.lua"
}

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child)child:visible(false):finishtweening()end,{})
	end,

	Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.Black)
		end
	},

}

for i=1,#scripts do
	t[#t+1] = LoadActor(scripts[i])..{
		OnCommand=function(self)
			local scale = 0.5
			if i == 1 then
				self:diffusealpha(1):sleep(0.25*scale):diffusealpha(0):sleep(0.75*scale):queuecommand("On")
			elseif i == 2 then
				self:diffusealpha(0):sleep(0.25*scale):diffusealpha(1):sleep(0.75*scale):queuecommand("On")
			elseif i == 3 then
				self:diffusealpha(0):sleep(0.25*2*scale):diffusealpha(1):sleep(0.5*scale):queuecommand("On")
			elseif i == 4 then
				self:diffusealpha(0):sleep(0.25*3*scale):diffusealpha(1):sleep(0.25*scale):queuecommand("On")
			end
		end
	}
end

return t