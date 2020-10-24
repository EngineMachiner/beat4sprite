
local scripts = {
	"../5thR003B/default.lua",
	"../5thR003C/default.lua",
	"../5thR003D/default.lua",
	"../5thR003E/default.lua"
}

local t = Def.ActorFrame{

	OnCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child) 
				child:visible(true)
		end )
	end,
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end

}

for i=#scripts,1,-1 do
	t[#t+1] = LoadActor(scripts[i])..{
		OnCommand=function(self)
			self:effectclock("beat"):set_tween_uses_effect_delta(true)
			PSX_BGA_Globals["BGA_ToolPreview"](self)		
			self:diffusealpha(1):sleep( i - 1 ):diffusealpha(0):sleep( #scripts - 1 )
				:queuecommand("Repeat")
		end,
		GoCommand=function(self)
			self:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:diffusealpha(1):sleep( 1 ):diffusealpha(0):sleep( #scripts - 1 )
			:queuecommand("Go")
		end
	}
end

return Def.ActorFrame{ t }