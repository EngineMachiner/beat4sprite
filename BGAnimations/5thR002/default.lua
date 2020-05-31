
local scripts = {
	"../5thR003B/default.lua",
	"../5thR003C/default.lua",
	"../5thR003D/default.lua",
	"../5thR003E/default.lua"
}

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(true)
		end )
	end,
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
		end )
	end

}

for i=#scripts,1,-1 do
	t[#t+1] = LoadActor(scripts[i])..{
		GainFocusCommand=function(self)
			self:effectclock("beat"):set_tween_uses_effect_delta(true)
			BGA_ToolPreview(self)		
			self:diffusealpha(1):sleep( i - 1 ):diffusealpha(0):sleep( #scripts - 1 )
				:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(1):sleep( 1 ):diffusealpha(0):sleep( #scripts - 1 )
			:queuecommand("Repeat")
		end
	}
end

return Def.ActorFrame{ t }