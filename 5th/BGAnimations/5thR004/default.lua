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

for i=#scripts,1,-1 do
	t[#t+1] = LoadActor(scripts[i])..{
		OnCommand=function(self)
			self:diffusealpha(1):sleep( ( i - 1 ) * 0.5 ):diffusealpha(0):sleep( ( #scripts - 1 ) * 0.5 )
			:queuecommand("Repeat")
			self:effectclock("beat"):set_tween_uses_effect_delta(true)
			ToolPreview(self)
		end,
		RepeatCommand=function(self)
			self:diffusealpha(1):sleep( 1 * 0.5 ):diffusealpha(0):sleep( ( #scripts - 1 ) * 0.5 )
			:queuecommand("Repeat")
		end
	}
end

	t[#t+1] = Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
			:diffuse(Color.Black):diffusealpha(0.5)
		end
	}

return t